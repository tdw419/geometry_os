; DESCRIPTION: Places a green dot at position (466, 122).
; PLAN: r0=466(x), r1=122(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 466
LDI r1, 122
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
