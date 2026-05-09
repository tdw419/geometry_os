; DESCRIPTION: Places a red dot at position (200, 127).
; PLAN: r0=200(x), r1=127(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 200
LDI r1, 127
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
