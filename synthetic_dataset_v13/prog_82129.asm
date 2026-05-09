; DESCRIPTION: Places a green dot at position (185, 7).
; PLAN: r0=185(x), r1=7(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 185
LDI r1, 7
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
