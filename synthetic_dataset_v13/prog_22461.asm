; DESCRIPTION: Sets a single purple pixel at (310, 91).
; PLAN: r0=310(x), r1=91(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 310
LDI r1, 91
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
