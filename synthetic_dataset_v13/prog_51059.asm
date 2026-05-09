; DESCRIPTION: Places a white dot at position (414, 116).
; PLAN: r0=414(x), r1=116(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 414
LDI r1, 116
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
