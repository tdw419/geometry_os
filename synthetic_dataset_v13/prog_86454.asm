; DESCRIPTION: Composite: Sets a single red pixel at (38, 9) then Places a magenta line segment connecting (257, 249) to (12, 170).
; PLAN: r0=38(x), r1=9(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=257(x1), r6=249(y1), r7=12(x2), r8=170(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 38
LDI r1, 9
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 257
LDI r6, 249
LDI r7, 12
LDI r8, 170
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
