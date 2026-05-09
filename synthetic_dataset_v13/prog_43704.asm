; DESCRIPTION: Places a magenta dot at position (395, 229).
; PLAN: r0=395(x), r1=229(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 395
LDI r1, 229
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
