; DESCRIPTION: Composite: Renders a magenta disk with center (94, 185) and radius 66 then Renders a black line between points (15, 199) and (317, 99) then Sets a single green pixel at (460, 157).
; PLAN: r0=94(x), r1=185(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x1), r6=199(y1), r7=317(x2), r8=99(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=460(x), r11=157(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 94
LDI r1, 185
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 199
LDI r7, 317
LDI r8, 99
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 460
LDI r11, 157
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
