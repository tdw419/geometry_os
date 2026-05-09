; DESCRIPTION: Composite: Places a black line segment connecting (194, 66) to (266, 0) then Draws a white circle centered at (285, 231) with radius 21.
; PLAN: r0=194(x1), r1=66(y1), r2=266(x2), r3=0(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=285(x), r6=231(y), r7=21(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 194
LDI r1, 66
LDI r2, 266
LDI r3, 0
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 231
LDI r7, 21
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
