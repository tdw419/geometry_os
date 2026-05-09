; DESCRIPTION: Composite: Creates a yellow circular shape at (189, 76) with radius 69 then Draws a blue line from (326, 140) to (187, 232).
; PLAN: r0=189(x), r1=76(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x1), r6=140(y1), r7=187(x2), r8=232(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 76
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 140
LDI r7, 187
LDI r8, 232
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
