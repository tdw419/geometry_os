; DESCRIPTION: Places a green dot at position (497, 152).
; PLAN: r0=497(x), r1=152(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 497
LDI r1, 152
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
