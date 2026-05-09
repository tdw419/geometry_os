; DESCRIPTION: Places a blue dot at position (317, 72).
; PLAN: r0=317(x), r1=72(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 317
LDI r1, 72
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
