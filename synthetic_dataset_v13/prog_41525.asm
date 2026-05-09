; DESCRIPTION: Places a magenta dot at position (385, 155).
; PLAN: r0=385(x), r1=155(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 385
LDI r1, 155
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
