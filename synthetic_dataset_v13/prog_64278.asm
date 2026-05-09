; DESCRIPTION: Places a blue dot at position (384, 216).
; PLAN: r0=384(x), r1=216(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 384
LDI r1, 216
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
