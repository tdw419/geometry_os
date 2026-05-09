; DESCRIPTION: Places a white dot at position (379, 124).
; PLAN: r0=379(x), r1=124(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 379
LDI r1, 124
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
