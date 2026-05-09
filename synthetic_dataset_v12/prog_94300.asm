; DESCRIPTION: Sets a single black pixel at (292, 75).
; PLAN: r0=292(x), r1=75(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 292
LDI r1, 75
LDI r2, 0x000000
PSET r0, r1, r2
HALT
