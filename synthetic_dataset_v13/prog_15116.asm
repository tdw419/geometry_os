; DESCRIPTION: Composite: Renders a purple line between points (187, 229) and (476, 85) then Sets a single green pixel at (242, 132) then Renders a white box of size 23x11 starting at (368, 15).
; PLAN: r0=187(x1), r1=229(y1), r2=476(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=242(x), r6=132(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=368(x), r11=15(y), r12=23(width), r13=11(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 187
LDI r1, 229
LDI r2, 476
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 132
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 368
LDI r11, 15
LDI r12, 23
LDI r13, 11
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
