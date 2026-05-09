; DESCRIPTION: Places a cyan dot at position (437, 51).
; PLAN: r0=437(x), r1=51(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 437
LDI r1, 51
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
