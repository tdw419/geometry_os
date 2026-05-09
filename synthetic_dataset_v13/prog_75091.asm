; DESCRIPTION: Places a green dot at position (188, 28).
; PLAN: r0=188(x), r1=28(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 28
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
