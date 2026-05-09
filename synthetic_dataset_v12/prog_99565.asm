; DESCRIPTION: Places a green dot at position (1, 127).
; PLAN: r0=1(x), r1=127(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 1
LDI r1, 127
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
