; DESCRIPTION: Places a magenta dot at position (20, 103).
; PLAN: r0=20(x), r1=103(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 103
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
