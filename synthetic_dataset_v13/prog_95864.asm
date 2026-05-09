; DESCRIPTION: Composite: Places a red circle of radius 41 at center (167, 112) then Places a black dot at position (358, 177).
; PLAN: r0=167(x), r1=112(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=358(x), r6=177(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 167
LDI r1, 112
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 358
LDI r6, 177
LDI r7, 0x000000
PSET r5, r6, r7
HALT
