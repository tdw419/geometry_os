; DESCRIPTION: Composite: Places a blue dot at position (100, 190) then Places a orange circle of radius 35 at center (282, 179).
; PLAN: r0=100(x), r1=190(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=282(x), r6=179(y), r7=35(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 100
LDI r1, 190
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 282
LDI r6, 179
LDI r7, 35
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
