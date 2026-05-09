; DESCRIPTION: Places a white dot at position (86, 99).
; PLAN: r0=86(x), r1=99(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 86
LDI r1, 99
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
