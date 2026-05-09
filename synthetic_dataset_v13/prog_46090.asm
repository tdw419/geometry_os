; DESCRIPTION: Places a cyan dot at position (478, 165).
; PLAN: r0=478(x), r1=165(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 478
LDI r1, 165
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
