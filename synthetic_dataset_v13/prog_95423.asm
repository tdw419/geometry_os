; DESCRIPTION: Composite: Sets a single red pixel at (357, 50) then Places a green line segment connecting (40, 150) to (458, 42).
; PLAN: r0=357(x), r1=50(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=40(x1), r6=150(y1), r7=458(x2), r8=42(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 357
LDI r1, 50
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 40
LDI r6, 150
LDI r7, 458
LDI r8, 42
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
