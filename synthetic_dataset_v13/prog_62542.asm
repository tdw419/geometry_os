; DESCRIPTION: Places a blue dot at position (509, 85).
; PLAN: r0=509(x), r1=85(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 509
LDI r1, 85
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
