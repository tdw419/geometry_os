; DESCRIPTION: Places a black dot at position (445, 156).
; PLAN: r0=445(x), r1=156(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 445
LDI r1, 156
LDI r2, 0x000000
PSET r0, r1, r2
HALT
