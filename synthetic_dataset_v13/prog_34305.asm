; DESCRIPTION: Composite: Places a blue dot at position (265, 235) then Renders a yellow line between points (377, 37) and (185, 234) then Renders a black disk with center (429, 159) and radius 14.
; PLAN: r0=265(x), r1=235(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=377(x1), r6=37(y1), r7=185(x2), r8=234(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=429(x), r11=159(y), r12=14(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 265
LDI r1, 235
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 377
LDI r6, 37
LDI r7, 185
LDI r8, 234
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 429
LDI r11, 159
LDI r12, 14
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
