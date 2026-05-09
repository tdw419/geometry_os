; DESCRIPTION: Composite: Renders a blue line between points (45, 59) and (302, 87) then Draws a yellow circle centered at (103, 183) with radius 20.
; PLAN: r0=45(x1), r1=59(y1), r2=302(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=183(y), r7=20(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 45
LDI r1, 59
LDI r2, 302
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 183
LDI r7, 20
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
