; DESCRIPTION: Places a green dot at position (283, 74).
; PLAN: r0=283(x), r1=74(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 283
LDI r1, 74
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
