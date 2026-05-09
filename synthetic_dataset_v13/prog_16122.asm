; DESCRIPTION: Places a blue dot at position (90, 68).
; PLAN: r0=90(x), r1=68(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 90
LDI r1, 68
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
