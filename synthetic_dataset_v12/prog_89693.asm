; DESCRIPTION: Places a yellow dot at position (448, 238).
; PLAN: r0=448(x), r1=238(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 448
LDI r1, 238
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
