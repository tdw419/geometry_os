; DESCRIPTION: Composite: Sets a single red pixel at (58, 73) then Places a magenta line segment connecting (114, 79) to (43, 161).
; PLAN: r0=58(x), r1=73(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=114(x1), r6=79(y1), r7=43(x2), r8=161(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 73
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 114
LDI r6, 79
LDI r7, 43
LDI r8, 161
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
