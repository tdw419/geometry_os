; DESCRIPTION: Places a cyan dot at position (83, 122).
; PLAN: r0=83(x), r1=122(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 83
LDI r1, 122
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
