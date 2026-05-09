; DESCRIPTION: Places a magenta dot at position (323, 169).
; PLAN: r0=323(x), r1=169(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 323
LDI r1, 169
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
