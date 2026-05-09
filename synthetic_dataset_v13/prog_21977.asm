; DESCRIPTION: Places a white dot at position (385, 116).
; PLAN: r0=385(x), r1=116(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 385
LDI r1, 116
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
