; DESCRIPTION: Places a cyan dot at position (238, 24).
; PLAN: r0=238(x), r1=24(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 238
LDI r1, 24
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
