; DESCRIPTION: Sets a single black pixel at (154, 56).
; PLAN: r0=154(x), r1=56(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 56
LDI r2, 0x000000
PSET r0, r1, r2
HALT
