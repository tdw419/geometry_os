; DESCRIPTION: Places a blue dot at position (282, 209).
; PLAN: r0=282(x), r1=209(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 282
LDI r1, 209
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
