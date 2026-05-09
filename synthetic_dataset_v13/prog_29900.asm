; DESCRIPTION: Places a cyan dot at position (66, 201).
; PLAN: r0=66(x), r1=201(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 66
LDI r1, 201
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
