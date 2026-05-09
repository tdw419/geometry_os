; DESCRIPTION: Places a cyan dot at position (133, 39).
; PLAN: r0=133(x), r1=39(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 133
LDI r1, 39
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
