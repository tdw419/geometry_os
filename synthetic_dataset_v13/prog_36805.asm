; DESCRIPTION: Places a blue dot at position (179, 163).
; PLAN: r0=179(x), r1=163(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 179
LDI r1, 163
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
