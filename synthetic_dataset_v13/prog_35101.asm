; DESCRIPTION: Places a cyan dot at position (423, 118).
; PLAN: r0=423(x), r1=118(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 423
LDI r1, 118
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
