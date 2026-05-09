; DESCRIPTION: Composite: Sets a single orange pixel at (5, 240) then Places a magenta line segment connecting (382, 92) to (102, 42).
; PLAN: r0=5(x), r1=240(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=382(x1), r6=92(y1), r7=102(x2), r8=42(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 5
LDI r1, 240
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 382
LDI r6, 92
LDI r7, 102
LDI r8, 42
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
