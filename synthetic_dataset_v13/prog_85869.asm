; DESCRIPTION: Places a blue dot at position (146, 105).
; PLAN: r0=146(x), r1=105(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 146
LDI r1, 105
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
