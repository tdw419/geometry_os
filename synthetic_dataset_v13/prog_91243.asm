; DESCRIPTION: Composite: Sets a single purple pixel at (154, 87) then Places a magenta line segment connecting (421, 102) to (82, 191).
; PLAN: r0=154(x), r1=87(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=421(x1), r6=102(y1), r7=82(x2), r8=191(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 87
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 421
LDI r6, 102
LDI r7, 82
LDI r8, 191
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
