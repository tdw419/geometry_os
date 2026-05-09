; DESCRIPTION: Places a green dot at position (155, 85).
; PLAN: r0=155(x), r1=85(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 155
LDI r1, 85
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
