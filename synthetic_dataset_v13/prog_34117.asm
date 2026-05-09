; DESCRIPTION: Sets a single white pixel at (51, 126).
; PLAN: r0=51(x), r1=126(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 126
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
