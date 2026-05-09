; DESCRIPTION: Composite: Renders a orange line between points (21, 38) and (115, 212) then Sets a single orange pixel at (33, 73) then Renders a magenta disk with center (56, 207) and radius 49.
; PLAN: r0=21(x1), r1=38(y1), r2=115(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=33(x), r6=73(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=56(x), r11=207(y), r12=49(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 21
LDI r1, 38
LDI r2, 115
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 73
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 56
LDI r11, 207
LDI r12, 49
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
