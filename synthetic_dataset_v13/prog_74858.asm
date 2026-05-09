; DESCRIPTION: Composite: Creates a red circular shape at (323, 125) with radius 70 then Places a blue dot at position (104, 120).
; PLAN: r0=323(x), r1=125(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x), r6=120(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 323
LDI r1, 125
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 120
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
