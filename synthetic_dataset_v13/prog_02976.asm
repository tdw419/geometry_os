; DESCRIPTION: Composite: Places a red circle of radius 32 at center (353, 159) then Places a blue dot at position (346, 122).
; PLAN: r0=353(x), r1=159(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x), r6=122(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 353
LDI r1, 159
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 122
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
