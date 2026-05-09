; DESCRIPTION: Places a cyan dot at position (37, 9).
; PLAN: r0=37(x), r1=9(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 37
LDI r1, 9
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
