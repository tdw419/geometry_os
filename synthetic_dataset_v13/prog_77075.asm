; DESCRIPTION: Places a magenta dot at position (491, 40).
; PLAN: r0=491(x), r1=40(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 491
LDI r1, 40
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
