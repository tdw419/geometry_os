; DESCRIPTION: Places a magenta dot at position (404, 85).
; PLAN: r0=404(x), r1=85(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 404
LDI r1, 85
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
