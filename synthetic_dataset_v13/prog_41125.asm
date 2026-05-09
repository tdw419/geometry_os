; DESCRIPTION: Composite: Sets a single purple pixel at (310, 20) then Places a red line segment connecting (184, 237) to (68, 10).
; PLAN: r0=310(x), r1=20(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=184(x1), r6=237(y1), r7=68(x2), r8=10(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 310
LDI r1, 20
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 184
LDI r6, 237
LDI r7, 68
LDI r8, 10
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
