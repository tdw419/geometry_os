; DESCRIPTION: Places a white dot at position (417, 102).
; PLAN: r0=417(x), r1=102(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 417
LDI r1, 102
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
