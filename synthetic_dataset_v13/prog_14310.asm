; DESCRIPTION: Places a green dot at position (289, 224).
; PLAN: r0=289(x), r1=224(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 289
LDI r1, 224
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
