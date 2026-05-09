; DESCRIPTION: Sets a single red pixel at (59, 136).
; PLAN: r0=59(x), r1=136(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 59
LDI r1, 136
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
