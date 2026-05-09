; DESCRIPTION: Places a green dot at position (69, 252).
; PLAN: r0=69(x), r1=252(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 69
LDI r1, 252
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
