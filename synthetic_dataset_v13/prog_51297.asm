; DESCRIPTION: Places a blue dot at position (143, 73).
; PLAN: r0=143(x), r1=73(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 143
LDI r1, 73
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
