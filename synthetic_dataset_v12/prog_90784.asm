; DESCRIPTION: Places a white dot at position (229, 114).
; PLAN: r0=229(x), r1=114(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 229
LDI r1, 114
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
