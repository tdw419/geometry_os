; DESCRIPTION: Places a white dot at position (487, 66).
; PLAN: r0=487(x), r1=66(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 487
LDI r1, 66
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
