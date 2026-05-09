; DESCRIPTION: Places a cyan dot at position (289, 112).
; PLAN: r0=289(x), r1=112(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 289
LDI r1, 112
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
