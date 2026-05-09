; DESCRIPTION: Places a cyan dot at position (431, 156).
; PLAN: r0=431(x), r1=156(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 431
LDI r1, 156
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
