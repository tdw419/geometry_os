; DESCRIPTION: Places a white dot at position (28, 137).
; PLAN: r0=28(x), r1=137(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 28
LDI r1, 137
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
