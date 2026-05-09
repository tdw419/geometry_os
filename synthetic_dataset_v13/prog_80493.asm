; DESCRIPTION: Places a green dot at position (461, 47).
; PLAN: r0=461(x), r1=47(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 461
LDI r1, 47
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
