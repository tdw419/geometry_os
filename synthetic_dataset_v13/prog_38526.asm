; DESCRIPTION: Places a white dot at position (45, 115).
; PLAN: r0=45(x), r1=115(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 45
LDI r1, 115
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
