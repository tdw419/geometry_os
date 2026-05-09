; DESCRIPTION: Composite: Renders a yellow line between points (102, 255) and (502, 217) then Draws a blue circle centered at (159, 106) with radius 77.
; PLAN: r0=102(x1), r1=255(y1), r2=502(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=159(x), r6=106(y), r7=77(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 102
LDI r1, 255
LDI r2, 502
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 106
LDI r7, 77
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
