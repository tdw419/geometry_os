; DESCRIPTION: Composite: Draws a blue line from (416, 171) to (282, 67) then Creates a black circular shape at (54, 165) with radius 45.
; PLAN: r0=416(x1), r1=171(y1), r2=282(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=54(x), r6=165(y), r7=45(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 416
LDI r1, 171
LDI r2, 282
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 165
LDI r7, 45
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
