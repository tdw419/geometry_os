; DESCRIPTION: Places a blue dot at position (189, 132).
; PLAN: r0=189(x), r1=132(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 189
LDI r1, 132
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
