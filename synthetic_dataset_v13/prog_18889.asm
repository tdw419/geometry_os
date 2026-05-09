; DESCRIPTION: Composite: Sets a single purple pixel at (282, 223) then Places a orange line segment connecting (111, 28) to (65, 183).
; PLAN: r0=282(x), r1=223(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=111(x1), r6=28(y1), r7=65(x2), r8=183(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 282
LDI r1, 223
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 111
LDI r6, 28
LDI r7, 65
LDI r8, 183
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
