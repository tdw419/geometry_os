; DESCRIPTION: Places a blue dot at position (132, 5).
; PLAN: r0=132(x), r1=5(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 132
LDI r1, 5
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
