; DESCRIPTION: Composite: Renders a black box of size 60x113 starting at (323, 103) then Sets a single cyan pixel at (118, 137) then Renders a orange line between points (43, 24) and (388, 14).
; PLAN: r0=323(x), r1=103(y), r2=60(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x), r6=137(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=43(x1), r11=24(y1), r12=388(x2), r13=14(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 103
LDI r2, 60
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 137
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 43
LDI r11, 24
LDI r12, 388
LDI r13, 14
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
