; DESCRIPTION: Composite: Places a magenta dot at position (169, 103) then Renders a orange disk with center (257, 187) and radius 41.
; PLAN: r0=169(x), r1=103(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=257(x), r6=187(y), r7=41(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 169
LDI r1, 103
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 257
LDI r6, 187
LDI r7, 41
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
