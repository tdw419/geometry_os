; DESCRIPTION: Sets a single purple pixel at (5, 154).
; PLAN: r0=5(x), r1=154(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 5
LDI r1, 154
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
