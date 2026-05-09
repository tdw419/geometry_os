; DESCRIPTION: Places a blue dot at position (143, 152).
; PLAN: r0=143(x), r1=152(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 143
LDI r1, 152
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
