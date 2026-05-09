; DESCRIPTION: Composite: Creates a blue circular shape at (162, 161) with radius 49 then Places a black dot at position (457, 218).
; PLAN: r0=162(x), r1=161(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x), r6=218(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 162
LDI r1, 161
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 218
LDI r7, 0x000000
PSET r5, r6, r7
HALT
