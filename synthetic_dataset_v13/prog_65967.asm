; DESCRIPTION: Places a white dot at position (9, 10).
; PLAN: r0=9(x), r1=10(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 9
LDI r1, 10
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
