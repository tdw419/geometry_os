; DESCRIPTION: Sets a single green pixel at (445, 51).
; PLAN: r0=445(x), r1=51(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 445
LDI r1, 51
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
