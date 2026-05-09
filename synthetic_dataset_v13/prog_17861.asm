; DESCRIPTION: Places a green dot at position (107, 136).
; PLAN: r0=107(x), r1=136(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 107
LDI r1, 136
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
