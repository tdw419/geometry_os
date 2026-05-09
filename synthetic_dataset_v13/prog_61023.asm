; DESCRIPTION: Places a blue dot at position (489, 80).
; PLAN: r0=489(x), r1=80(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 489
LDI r1, 80
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
