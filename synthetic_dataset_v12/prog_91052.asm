; DESCRIPTION: Places a magenta dot at position (420, 4).
; PLAN: r0=420(x), r1=4(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 420
LDI r1, 4
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
