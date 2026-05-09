; DESCRIPTION: Places a white dot at position (334, 25).
; PLAN: r0=334(x), r1=25(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 334
LDI r1, 25
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
