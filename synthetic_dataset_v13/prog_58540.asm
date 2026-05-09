; DESCRIPTION: Composite: Renders a blue box of size 10x107 starting at (167, 106) then Places a black dot at position (378, 118).
; PLAN: r0=167(x), r1=106(y), r2=10(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=378(x), r6=118(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 167
LDI r1, 106
LDI r2, 10
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 118
LDI r7, 0x000000
PSET r5, r6, r7
HALT
