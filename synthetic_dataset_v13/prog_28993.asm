; DESCRIPTION: Composite: Sets a single magenta pixel at (254, 140) then Places a orange line segment connecting (192, 253) to (423, 162).
; PLAN: r0=254(x), r1=140(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=192(x1), r6=253(y1), r7=423(x2), r8=162(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 140
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 192
LDI r6, 253
LDI r7, 423
LDI r8, 162
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
