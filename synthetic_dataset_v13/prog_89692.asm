; DESCRIPTION: Places a red dot at position (166, 20).
; PLAN: r0=166(x), r1=20(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 20
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
