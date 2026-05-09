; DESCRIPTION: Sets a single black pixel at (239, 167).
; PLAN: r0=239(x), r1=167(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 239
LDI r1, 167
LDI r2, 0x000000
PSET r0, r1, r2
HALT
