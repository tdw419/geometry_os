; DESCRIPTION: Places a green dot at position (324, 183).
; PLAN: r0=324(x), r1=183(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 324
LDI r1, 183
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
