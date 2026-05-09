; DESCRIPTION: Composite: Places a cyan line segment connecting (478, 177) to (196, 89) then Sets a single green pixel at (366, 169) then Renders a magenta disk with center (397, 232) and radius 21.
; PLAN: r0=478(x1), r1=177(y1), r2=196(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=366(x), r6=169(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=397(x), r11=232(y), r12=21(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 478
LDI r1, 177
LDI r2, 196
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 169
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 397
LDI r11, 232
LDI r12, 21
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
