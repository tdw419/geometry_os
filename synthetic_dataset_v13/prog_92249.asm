; DESCRIPTION: Composite: Places a yellow line segment connecting (125, 44) to (155, 56) then Renders a green disk with center (267, 78) and radius 77.
; PLAN: r0=125(x1), r1=44(y1), r2=155(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=267(x), r6=78(y), r7=77(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 125
LDI r1, 44
LDI r2, 155
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 78
LDI r7, 77
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
