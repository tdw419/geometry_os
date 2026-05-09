; DESCRIPTION: Sets a single purple pixel at (283, 113).
; PLAN: r0=283(x), r1=113(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 283
LDI r1, 113
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
