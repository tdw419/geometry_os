; DESCRIPTION: Places a magenta dot at position (80, 48).
; PLAN: r0=80(x), r1=48(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 48
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
