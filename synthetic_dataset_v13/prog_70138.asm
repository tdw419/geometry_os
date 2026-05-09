; DESCRIPTION: Sets a single blue pixel at (473, 154).
; PLAN: r0=473(x), r1=154(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 473
LDI r1, 154
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
