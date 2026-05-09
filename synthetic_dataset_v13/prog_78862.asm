; DESCRIPTION: Composite: Creates a black circular shape at (432, 76) with radius 35 then Places a black line segment connecting (461, 81) to (28, 240).
; PLAN: r0=432(x), r1=76(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=461(x1), r6=81(y1), r7=28(x2), r8=240(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 432
LDI r1, 76
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 461
LDI r6, 81
LDI r7, 28
LDI r8, 240
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
