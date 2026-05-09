; DESCRIPTION: Places a green dot at position (311, 230).
; PLAN: r0=311(x), r1=230(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 311
LDI r1, 230
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
