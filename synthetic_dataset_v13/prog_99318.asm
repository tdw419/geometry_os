; DESCRIPTION: Composite: Sets a single black pixel at (423, 233) then Places a magenta line segment connecting (367, 138) to (119, 222).
; PLAN: r0=423(x), r1=233(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=367(x1), r6=138(y1), r7=119(x2), r8=222(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 423
LDI r1, 233
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 367
LDI r6, 138
LDI r7, 119
LDI r8, 222
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
