; DESCRIPTION: Places a magenta dot at position (180, 88).
; PLAN: r0=180(x), r1=88(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 180
LDI r1, 88
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
