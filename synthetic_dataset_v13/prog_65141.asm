; DESCRIPTION: Places a green dot at position (287, 145).
; PLAN: r0=287(x), r1=145(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 287
LDI r1, 145
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
