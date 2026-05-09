; DESCRIPTION: Places a cyan dot at position (471, 33).
; PLAN: r0=471(x), r1=33(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 471
LDI r1, 33
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
