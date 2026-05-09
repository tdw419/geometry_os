; DESCRIPTION: Places a green dot at position (49, 229).
; PLAN: r0=49(x), r1=229(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 49
LDI r1, 229
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
