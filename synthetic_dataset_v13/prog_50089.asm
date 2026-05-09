; DESCRIPTION: Composite: Sets a single orange pixel at (355, 247) then Places a yellow line segment connecting (169, 22) to (348, 28).
; PLAN: r0=355(x), r1=247(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=169(x1), r6=22(y1), r7=348(x2), r8=28(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 355
LDI r1, 247
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 169
LDI r6, 22
LDI r7, 348
LDI r8, 28
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
