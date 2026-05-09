; DESCRIPTION: Places a green dot at position (453, 205).
; PLAN: r0=453(x), r1=205(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 453
LDI r1, 205
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
