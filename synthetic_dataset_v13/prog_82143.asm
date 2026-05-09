; DESCRIPTION: Places a green dot at position (137, 19).
; PLAN: r0=137(x), r1=19(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 19
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
