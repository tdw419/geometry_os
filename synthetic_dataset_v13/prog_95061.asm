; DESCRIPTION: Sets a single purple pixel at (255, 65).
; PLAN: r0=255(x), r1=65(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 255
LDI r1, 65
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
