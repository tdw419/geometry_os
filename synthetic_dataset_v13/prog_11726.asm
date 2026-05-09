; DESCRIPTION: Composite: Sets a single orange pixel at (260, 80) then Places a white circle of radius 30 at center (274, 164).
; PLAN: r0=260(x), r1=80(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=274(x), r6=164(y), r7=30(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 260
LDI r1, 80
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 274
LDI r6, 164
LDI r7, 30
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
