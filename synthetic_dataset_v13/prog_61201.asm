; DESCRIPTION: Composite: Places a magenta circle of radius 14 at center (146, 14) then Places a orange dot at position (159, 237).
; PLAN: r0=146(x), r1=14(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=159(x), r6=237(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 146
LDI r1, 14
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 159
LDI r6, 237
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
