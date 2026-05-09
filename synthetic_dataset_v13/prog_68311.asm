; DESCRIPTION: Composite: Creates a magenta circular shape at (148, 181) with radius 74 then Places a yellow line segment connecting (61, 155) to (359, 184).
; PLAN: r0=148(x), r1=181(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=61(x1), r6=155(y1), r7=359(x2), r8=184(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 148
LDI r1, 181
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 61
LDI r6, 155
LDI r7, 359
LDI r8, 184
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
