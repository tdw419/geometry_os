; DESCRIPTION: Places a cyan dot at position (378, 1).
; PLAN: r0=378(x), r1=1(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 378
LDI r1, 1
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
