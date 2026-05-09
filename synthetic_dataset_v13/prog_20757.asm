; DESCRIPTION: Sets a single black pixel at (85, 154).
; PLAN: r0=85(x), r1=154(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 154
LDI r2, 0x000000
PSET r0, r1, r2
HALT
