; DESCRIPTION: Composite: Renders a blue line between points (420, 1) and (134, 24) then Sets a single red pixel at (64, 18) then Renders a green disk with center (195, 179) and radius 67.
; PLAN: r0=420(x1), r1=1(y1), r2=134(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=18(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=195(x), r11=179(y), r12=67(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 420
LDI r1, 1
LDI r2, 134
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 18
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 195
LDI r11, 179
LDI r12, 67
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
