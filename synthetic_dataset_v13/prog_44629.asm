; DESCRIPTION: Places a green dot at position (74, 10).
; PLAN: r0=74(x), r1=10(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 74
LDI r1, 10
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
