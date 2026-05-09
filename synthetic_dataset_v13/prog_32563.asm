; DESCRIPTION: Places a green dot at position (256, 11).
; PLAN: r0=256(x), r1=11(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 256
LDI r1, 11
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
