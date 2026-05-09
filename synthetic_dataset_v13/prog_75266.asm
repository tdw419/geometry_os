; DESCRIPTION: Places a green dot at position (504, 199).
; PLAN: r0=504(x), r1=199(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 504
LDI r1, 199
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
