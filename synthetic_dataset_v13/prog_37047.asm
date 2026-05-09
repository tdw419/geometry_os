; DESCRIPTION: Places a black dot at position (306, 37).
; PLAN: r0=306(x), r1=37(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 306
LDI r1, 37
LDI r2, 0x000000
PSET r0, r1, r2
HALT
