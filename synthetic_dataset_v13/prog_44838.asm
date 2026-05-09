; DESCRIPTION: Places a green dot at position (456, 101).
; PLAN: r0=456(x), r1=101(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 456
LDI r1, 101
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
