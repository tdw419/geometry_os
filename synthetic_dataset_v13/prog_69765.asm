; DESCRIPTION: Places a green dot at position (184, 216).
; PLAN: r0=184(x), r1=216(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 184
LDI r1, 216
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
