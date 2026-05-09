; DESCRIPTION: Places a black dot at position (391, 167).
; PLAN: r0=391(x), r1=167(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 391
LDI r1, 167
LDI r2, 0x000000
PSET r0, r1, r2
HALT
