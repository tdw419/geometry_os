; DESCRIPTION: Places a blue dot at position (307, 141).
; PLAN: r0=307(x), r1=141(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 307
LDI r1, 141
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
