; DESCRIPTION: Composite: Sets a single yellow pixel at (154, 64) then Places a magenta line segment connecting (484, 131) to (77, 116).
; PLAN: r0=154(x), r1=64(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=484(x1), r6=131(y1), r7=77(x2), r8=116(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 64
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 484
LDI r6, 131
LDI r7, 77
LDI r8, 116
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
