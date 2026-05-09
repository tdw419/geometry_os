; DESCRIPTION: Places a cyan dot at position (397, 106).
; PLAN: r0=397(x), r1=106(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 397
LDI r1, 106
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
