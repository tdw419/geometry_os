; DESCRIPTION: Places a black dot at position (292, 200).
; PLAN: r0=292(x), r1=200(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 292
LDI r1, 200
LDI r2, 0x000000
PSET r0, r1, r2
HALT
