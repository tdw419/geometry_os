; DESCRIPTION: Composite: Places a blue line segment connecting (123, 175) to (503, 38) then Draws a magenta circle centered at (227, 145) with radius 77.
; PLAN: r0=123(x1), r1=175(y1), r2=503(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=145(y), r7=77(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 123
LDI r1, 175
LDI r2, 503
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 145
LDI r7, 77
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
