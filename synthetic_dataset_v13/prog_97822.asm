; DESCRIPTION: Places a white dot at position (211, 216).
; PLAN: r0=211(x), r1=216(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 211
LDI r1, 216
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
