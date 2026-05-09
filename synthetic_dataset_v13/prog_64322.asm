; DESCRIPTION: Places a green dot at position (236, 36).
; PLAN: r0=236(x), r1=36(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 236
LDI r1, 36
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
