; DESCRIPTION: Sets a single black pixel at (174, 240).
; PLAN: r0=174(x), r1=240(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 174
LDI r1, 240
LDI r2, 0x000000
PSET r0, r1, r2
HALT
