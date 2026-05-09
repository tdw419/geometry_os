; DESCRIPTION: Sets a single white pixel at (391, 134).
; PLAN: r0=391(x), r1=134(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 391
LDI r1, 134
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
