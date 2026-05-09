; DESCRIPTION: Composite: Sets a single red pixel at (195, 116) then Places a blue circle of radius 49 at center (258, 186).
; PLAN: r0=195(x), r1=116(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=258(x), r6=186(y), r7=49(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 195
LDI r1, 116
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 258
LDI r6, 186
LDI r7, 49
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
