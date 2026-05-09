; DESCRIPTION: Places a green dot at position (251, 12).
; PLAN: r0=251(x), r1=12(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 251
LDI r1, 12
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
