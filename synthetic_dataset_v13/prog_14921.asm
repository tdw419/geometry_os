; DESCRIPTION: Places a blue dot at position (117, 209).
; PLAN: r0=117(x), r1=209(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 117
LDI r1, 209
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
