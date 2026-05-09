; DESCRIPTION: Sets a single green pixel at (90, 171).
; PLAN: r0=90(x), r1=171(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 90
LDI r1, 171
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
