; DESCRIPTION: Places a cyan dot at position (177, 10).
; PLAN: r0=177(x), r1=10(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 10
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
