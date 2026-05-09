; DESCRIPTION: Composite: Sets a single green pixel at (286, 253) then Places a blue circle of radius 50 at center (382, 182).
; PLAN: r0=286(x), r1=253(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=382(x), r6=182(y), r7=50(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 286
LDI r1, 253
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 382
LDI r6, 182
LDI r7, 50
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
