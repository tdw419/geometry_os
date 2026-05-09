; DESCRIPTION: Composite: Places a magenta circle of radius 33 at center (352, 175) then Places a white dot at position (461, 205).
; PLAN: r0=352(x), r1=175(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=461(x), r6=205(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 352
LDI r1, 175
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 461
LDI r6, 205
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
