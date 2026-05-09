; DESCRIPTION: Places a cyan dot at position (393, 124).
; PLAN: r0=393(x), r1=124(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 393
LDI r1, 124
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
