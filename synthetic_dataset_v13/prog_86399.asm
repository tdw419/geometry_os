; DESCRIPTION: Places a blue dot at position (69, 36).
; PLAN: r0=69(x), r1=36(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 69
LDI r1, 36
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
