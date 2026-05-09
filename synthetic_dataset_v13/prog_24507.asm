; DESCRIPTION: Composite: Places a magenta circle of radius 55 at center (267, 67) then Places a black dot at position (41, 214).
; PLAN: r0=267(x), r1=67(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x), r6=214(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 267
LDI r1, 67
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 214
LDI r7, 0x000000
PSET r5, r6, r7
HALT
