; DESCRIPTION: Places a green dot at position (497, 56).
; PLAN: r0=497(x), r1=56(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 497
LDI r1, 56
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
