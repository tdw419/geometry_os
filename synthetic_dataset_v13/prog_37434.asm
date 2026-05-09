; DESCRIPTION: Places a green dot at position (145, 188).
; PLAN: r0=145(x), r1=188(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 145
LDI r1, 188
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
