; DESCRIPTION: Places a green dot at position (64, 130).
; PLAN: r0=64(x), r1=130(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 64
LDI r1, 130
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
