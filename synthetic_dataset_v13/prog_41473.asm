; DESCRIPTION: Composite: Places a red line segment connecting (219, 138) to (62, 180) then Draws a black circle centered at (331, 138) with radius 39.
; PLAN: r0=219(x1), r1=138(y1), r2=62(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=331(x), r6=138(y), r7=39(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 219
LDI r1, 138
LDI r2, 62
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 138
LDI r7, 39
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
