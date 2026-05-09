; DESCRIPTION: Composite: Renders a white line between points (250, 144) and (268, 160) then Renders a blue disk with center (235, 134) and radius 55.
; PLAN: r0=250(x1), r1=144(y1), r2=268(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=134(y), r7=55(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 250
LDI r1, 144
LDI r2, 268
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 134
LDI r7, 55
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
