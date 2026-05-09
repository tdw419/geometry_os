; DESCRIPTION: Places a green dot at position (506, 67).
; PLAN: r0=506(x), r1=67(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 506
LDI r1, 67
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
