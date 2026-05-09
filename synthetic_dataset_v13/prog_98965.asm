; DESCRIPTION: Composite: Sets a single orange pixel at (423, 25) then Places a magenta line segment connecting (286, 161) to (153, 8).
; PLAN: r0=423(x), r1=25(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=286(x1), r6=161(y1), r7=153(x2), r8=8(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 423
LDI r1, 25
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 286
LDI r6, 161
LDI r7, 153
LDI r8, 8
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
