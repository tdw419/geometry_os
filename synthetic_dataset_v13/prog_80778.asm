; DESCRIPTION: Composite: Renders a yellow box of size 79x89 starting at (32, 2) then Renders a blue line between points (507, 38) and (323, 156) then Sets a single blue pixel at (285, 2).
; PLAN: r0=32(x), r1=2(y), r2=79(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=507(x1), r6=38(y1), r7=323(x2), r8=156(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=285(x), r11=2(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 32
LDI r1, 2
LDI r2, 79
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 507
LDI r6, 38
LDI r7, 323
LDI r8, 156
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 285
LDI r11, 2
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
