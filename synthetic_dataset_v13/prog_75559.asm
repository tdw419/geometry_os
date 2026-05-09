; DESCRIPTION: Places a magenta dot at position (387, 35).
; PLAN: r0=387(x), r1=35(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 387
LDI r1, 35
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
