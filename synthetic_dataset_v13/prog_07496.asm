; DESCRIPTION: Places a green dot at position (101, 32).
; PLAN: r0=101(x), r1=32(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 32
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
