; DESCRIPTION: Places a green dot at position (417, 184).
; PLAN: r0=417(x), r1=184(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 417
LDI r1, 184
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
