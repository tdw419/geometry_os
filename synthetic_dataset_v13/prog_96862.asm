; DESCRIPTION: Composite: Sets a single yellow pixel at (308, 47) then Creates a white circular shape at (260, 150) with radius 69.
; PLAN: r0=308(x), r1=47(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=260(x), r6=150(y), r7=69(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 308
LDI r1, 47
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 260
LDI r6, 150
LDI r7, 69
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
