; DESCRIPTION: Places a cyan dot at position (399, 34).
; PLAN: r0=399(x), r1=34(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 399
LDI r1, 34
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
