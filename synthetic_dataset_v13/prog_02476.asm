; DESCRIPTION: Places a magenta dot at position (375, 193).
; PLAN: r0=375(x), r1=193(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 375
LDI r1, 193
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
