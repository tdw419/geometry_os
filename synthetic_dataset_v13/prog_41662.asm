; DESCRIPTION: Places a cyan dot at position (432, 139).
; PLAN: r0=432(x), r1=139(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 432
LDI r1, 139
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
