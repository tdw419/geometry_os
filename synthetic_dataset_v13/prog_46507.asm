; DESCRIPTION: Places a white dot at position (357, 181).
; PLAN: r0=357(x), r1=181(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 357
LDI r1, 181
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
