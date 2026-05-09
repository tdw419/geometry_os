; DESCRIPTION: Composite: Places a magenta dot at position (469, 30) then Places a purple line segment connecting (69, 241) to (495, 117).
; PLAN: r0=469(x), r1=30(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=69(x1), r6=241(y1), r7=495(x2), r8=117(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 469
LDI r1, 30
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 69
LDI r6, 241
LDI r7, 495
LDI r8, 117
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
