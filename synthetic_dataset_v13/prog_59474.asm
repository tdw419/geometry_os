; DESCRIPTION: Composite: Creates a magenta circular shape at (74, 164) with radius 40 then Places a black dot at position (171, 216).
; PLAN: r0=74(x), r1=164(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=171(x), r6=216(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 74
LDI r1, 164
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 171
LDI r6, 216
LDI r7, 0x000000
PSET r5, r6, r7
HALT
