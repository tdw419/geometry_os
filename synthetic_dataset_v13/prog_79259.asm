; DESCRIPTION: Places a cyan dot at position (71, 31).
; PLAN: r0=71(x), r1=31(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 71
LDI r1, 31
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
