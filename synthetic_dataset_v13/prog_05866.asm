; DESCRIPTION: Composite: Places a red line segment connecting (237, 169) to (454, 212) then Renders a purple box of size 85x20 starting at (366, 193) then Sets a single blue pixel at (68, 64).
; PLAN: r0=237(x1), r1=169(y1), r2=454(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=366(x), r6=193(y), r7=85(width), r8=20(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=68(x), r11=64(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 237
LDI r1, 169
LDI r2, 454
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 193
LDI r7, 85
LDI r8, 20
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 68
LDI r11, 64
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
