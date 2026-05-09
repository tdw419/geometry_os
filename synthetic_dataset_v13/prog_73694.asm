; DESCRIPTION: Places a white dot at position (269, 119).
; PLAN: r0=269(x), r1=119(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 269
LDI r1, 119
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
