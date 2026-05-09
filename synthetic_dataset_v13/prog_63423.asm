; DESCRIPTION: Composite: Places a white circle of radius 66 at center (379, 95) then Places a magenta dot at position (170, 155).
; PLAN: r0=379(x), r1=95(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=170(x), r6=155(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 379
LDI r1, 95
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 170
LDI r6, 155
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
