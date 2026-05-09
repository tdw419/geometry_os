; DESCRIPTION: Places a blue dot at position (493, 208).
; PLAN: r0=493(x), r1=208(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 493
LDI r1, 208
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
