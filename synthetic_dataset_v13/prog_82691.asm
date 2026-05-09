; DESCRIPTION: Places a white dot at position (65, 99).
; PLAN: r0=65(x), r1=99(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 65
LDI r1, 99
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
