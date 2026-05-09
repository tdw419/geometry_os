; DESCRIPTION: Composite: Creates a blue circular shape at (180, 81) with radius 49 then Places a red dot at position (422, 242).
; PLAN: r0=180(x), r1=81(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x), r6=242(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 180
LDI r1, 81
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 242
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
