; DESCRIPTION: Places a blue dot at position (8, 167).
; PLAN: r0=8(x), r1=167(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 8
LDI r1, 167
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
