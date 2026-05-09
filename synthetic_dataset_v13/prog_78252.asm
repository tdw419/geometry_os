; DESCRIPTION: Composite: Creates a black circular shape at (425, 112) with radius 23 then Places a orange line segment connecting (27, 55) to (148, 91).
; PLAN: r0=425(x), r1=112(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=27(x1), r6=55(y1), r7=148(x2), r8=91(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 425
LDI r1, 112
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 27
LDI r6, 55
LDI r7, 148
LDI r8, 91
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
