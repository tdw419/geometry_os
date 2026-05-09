; DESCRIPTION: Places a black dot at position (127, 9).
; PLAN: r0=127(x), r1=9(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 127
LDI r1, 9
LDI r2, 0x000000
PSET r0, r1, r2
HALT
