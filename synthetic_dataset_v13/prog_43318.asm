; DESCRIPTION: Sets a single magenta pixel at (415, 50).
; PLAN: r0=415(x), r1=50(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 415
LDI r1, 50
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
