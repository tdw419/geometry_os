; DESCRIPTION: Composite: Places a red line segment connecting (2, 45) to (280, 4) then Draws a red circle centered at (137, 175) with radius 53.
; PLAN: r0=2(x1), r1=45(y1), r2=280(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=175(y), r7=53(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 2
LDI r1, 45
LDI r2, 280
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 175
LDI r7, 53
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
