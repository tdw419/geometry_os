; DESCRIPTION: Places a white dot at position (341, 8).
; PLAN: r0=341(x), r1=8(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 341
LDI r1, 8
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
