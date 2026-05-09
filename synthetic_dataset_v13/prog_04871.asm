; DESCRIPTION: Composite: Draws a black circle centered at (461, 129) with radius 27 then Places a orange line segment connecting (135, 141) to (306, 116).
; PLAN: r0=461(x), r1=129(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=135(x1), r6=141(y1), r7=306(x2), r8=116(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 461
LDI r1, 129
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 135
LDI r6, 141
LDI r7, 306
LDI r8, 116
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
