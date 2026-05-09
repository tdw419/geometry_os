; DESCRIPTION: Places a magenta dot at position (423, 92).
; PLAN: r0=423(x), r1=92(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 423
LDI r1, 92
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
