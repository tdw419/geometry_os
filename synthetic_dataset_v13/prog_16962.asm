; DESCRIPTION: Places a magenta dot at position (472, 39).
; PLAN: r0=472(x), r1=39(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 472
LDI r1, 39
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
