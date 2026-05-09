; DESCRIPTION: Places a green dot at position (312, 62).
; PLAN: r0=312(x), r1=62(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 312
LDI r1, 62
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
