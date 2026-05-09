; DESCRIPTION: Sets a single purple pixel at (416, 62).
; PLAN: r0=416(x), r1=62(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 416
LDI r1, 62
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
