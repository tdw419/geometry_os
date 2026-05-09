; DESCRIPTION: Places a green dot at position (25, 133).
; PLAN: r0=25(x), r1=133(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 25
LDI r1, 133
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
