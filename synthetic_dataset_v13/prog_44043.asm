; DESCRIPTION: Places a red dot at position (127, 39).
; PLAN: r0=127(x), r1=39(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 127
LDI r1, 39
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
