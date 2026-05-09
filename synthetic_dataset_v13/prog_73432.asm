; DESCRIPTION: Places a green dot at position (136, 141).
; PLAN: r0=136(x), r1=141(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 136
LDI r1, 141
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
