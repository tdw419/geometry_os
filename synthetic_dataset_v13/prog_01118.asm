; DESCRIPTION: Places a blue dot at position (188, 128).
; PLAN: r0=188(x), r1=128(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 128
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
