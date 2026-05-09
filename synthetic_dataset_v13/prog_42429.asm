; DESCRIPTION: Composite: Sets a single white pixel at (445, 117) then Places a orange line segment connecting (189, 178) to (358, 167).
; PLAN: r0=445(x), r1=117(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=189(x1), r6=178(y1), r7=358(x2), r8=167(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 445
LDI r1, 117
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 189
LDI r6, 178
LDI r7, 358
LDI r8, 167
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
