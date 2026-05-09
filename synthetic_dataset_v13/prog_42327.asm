; DESCRIPTION: Composite: Places a blue line segment connecting (177, 200) to (464, 213) then Draws a green circle centered at (169, 130) with radius 56.
; PLAN: r0=177(x1), r1=200(y1), r2=464(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=169(x), r6=130(y), r7=56(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 177
LDI r1, 200
LDI r2, 464
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 130
LDI r7, 56
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
