; DESCRIPTION: Places a magenta dot at position (225, 1).
; PLAN: r0=225(x), r1=1(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 225
LDI r1, 1
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
