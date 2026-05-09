; DESCRIPTION: Places a white dot at position (23, 109).
; PLAN: r0=23(x), r1=109(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 109
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
