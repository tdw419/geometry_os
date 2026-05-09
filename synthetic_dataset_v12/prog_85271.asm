; DESCRIPTION: Places a magenta dot at position (305, 76).
; PLAN: r0=305(x), r1=76(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 305
LDI r1, 76
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
