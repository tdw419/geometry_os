; DESCRIPTION: Sets a single yellow pixel at (22, 151).
; PLAN: r0=22(x), r1=151(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 22
LDI r1, 151
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
