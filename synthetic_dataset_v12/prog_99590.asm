; DESCRIPTION: Places a blue dot at position (85, 179).
; PLAN: r0=85(x), r1=179(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 179
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
