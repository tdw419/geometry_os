; DESCRIPTION: Places a cyan dot at position (339, 121).
; PLAN: r0=339(x), r1=121(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 339
LDI r1, 121
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
