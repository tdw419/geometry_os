; DESCRIPTION: Places a magenta dot at position (130, 178).
; PLAN: r0=130(x), r1=178(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 130
LDI r1, 178
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
