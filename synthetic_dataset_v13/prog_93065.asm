; DESCRIPTION: Composite: Places a blue dot at position (134, 90) then Places a magenta line segment connecting (268, 76) to (469, 182).
; PLAN: r0=134(x), r1=90(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=268(x1), r6=76(y1), r7=469(x2), r8=182(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 90
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 268
LDI r6, 76
LDI r7, 469
LDI r8, 182
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
