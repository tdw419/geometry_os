; DESCRIPTION: Places a green dot at position (304, 184).
; PLAN: r0=304(x), r1=184(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 304
LDI r1, 184
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
