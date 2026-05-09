; DESCRIPTION: Composite: Places a blue dot at position (323, 42) then Places a orange circle of radius 28 at center (230, 121).
; PLAN: r0=323(x), r1=42(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=230(x), r6=121(y), r7=28(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 323
LDI r1, 42
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 230
LDI r6, 121
LDI r7, 28
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
