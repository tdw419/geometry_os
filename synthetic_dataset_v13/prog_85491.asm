; DESCRIPTION: Composite: Renders a red box of size 97x87 starting at (245, 90) then Places a yellow dot at position (361, 250) then Renders a blue line between points (363, 68) and (466, 5).
; PLAN: r0=245(x), r1=90(y), r2=97(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=361(x), r6=250(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=363(x1), r11=68(y1), r12=466(x2), r13=5(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 245
LDI r1, 90
LDI r2, 97
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 361
LDI r6, 250
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 363
LDI r11, 68
LDI r12, 466
LDI r13, 5
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
