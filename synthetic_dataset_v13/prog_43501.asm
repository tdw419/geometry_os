; DESCRIPTION: Places a blue dot at position (80, 92).
; PLAN: r0=80(x), r1=92(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 92
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
