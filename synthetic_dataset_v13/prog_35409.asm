; DESCRIPTION: Sets a single magenta pixel at (398, 255).
; PLAN: r0=398(x), r1=255(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 398
LDI r1, 255
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
