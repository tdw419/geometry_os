; DESCRIPTION: Places a white dot at position (232, 184).
; PLAN: r0=232(x), r1=184(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 184
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
