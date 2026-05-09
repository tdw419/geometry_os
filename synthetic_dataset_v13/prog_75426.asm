; DESCRIPTION: Places a blue dot at position (150, 132).
; PLAN: r0=150(x), r1=132(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 132
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
