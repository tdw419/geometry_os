; DESCRIPTION: Places a green dot at position (252, 108).
; PLAN: r0=252(x), r1=108(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 252
LDI r1, 108
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
