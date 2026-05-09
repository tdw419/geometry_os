; DESCRIPTION: Composite: Creates a black circular shape at (383, 91) with radius 44 then Places a orange line segment connecting (60, 138) to (86, 147).
; PLAN: r0=383(x), r1=91(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=60(x1), r6=138(y1), r7=86(x2), r8=147(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 383
LDI r1, 91
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 60
LDI r6, 138
LDI r7, 86
LDI r8, 147
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
