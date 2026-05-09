; DESCRIPTION: Places a white dot at position (483, 210).
; PLAN: r0=483(x), r1=210(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 483
LDI r1, 210
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
