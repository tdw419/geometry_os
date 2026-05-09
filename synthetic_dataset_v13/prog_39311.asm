; DESCRIPTION: Places a cyan dot at position (122, 157).
; PLAN: r0=122(x), r1=157(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 157
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
