; DESCRIPTION: Composite: Places a magenta circle of radius 58 at center (442, 125) then Places a white dot at position (334, 108).
; PLAN: r0=442(x), r1=125(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x), r6=108(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 442
LDI r1, 125
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 108
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
