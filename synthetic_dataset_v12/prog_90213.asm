; DESCRIPTION: Places a magenta dot at position (69, 6).
; PLAN: r0=69(x), r1=6(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 69
LDI r1, 6
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
