; DESCRIPTION: Places a green dot at position (509, 58).
; PLAN: r0=509(x), r1=58(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 509
LDI r1, 58
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
