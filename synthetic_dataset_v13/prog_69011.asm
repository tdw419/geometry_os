; DESCRIPTION: Places a cyan dot at position (426, 98).
; PLAN: r0=426(x), r1=98(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 426
LDI r1, 98
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
