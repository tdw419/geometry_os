; DESCRIPTION: Places a magenta dot at position (504, 155).
; PLAN: r0=504(x), r1=155(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 504
LDI r1, 155
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
