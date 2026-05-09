; DESCRIPTION: Places a magenta dot at position (268, 33).
; PLAN: r0=268(x), r1=33(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 268
LDI r1, 33
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
