; DESCRIPTION: Composite: Sets a single black pixel at (183, 108) then Places a black line segment connecting (251, 150) to (291, 75) then Creates a red circular shape at (115, 108) with radius 69.
; PLAN: r0=183(x), r1=108(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=251(x1), r6=150(y1), r7=291(x2), r8=75(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=115(x), r11=108(y), r12=69(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 183
LDI r1, 108
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 251
LDI r6, 150
LDI r7, 291
LDI r8, 75
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 115
LDI r11, 108
LDI r12, 69
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
