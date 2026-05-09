; DESCRIPTION: Places a magenta dot at position (170, 120).
; PLAN: r0=170(x), r1=120(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 170
LDI r1, 120
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
