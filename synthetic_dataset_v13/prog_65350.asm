; DESCRIPTION: Places a green dot at position (328, 191).
; PLAN: r0=328(x), r1=191(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 328
LDI r1, 191
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
