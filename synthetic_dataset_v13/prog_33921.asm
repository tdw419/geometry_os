; DESCRIPTION: Composite: Places a magenta dot at position (79, 176) then Places a magenta line segment connecting (467, 192) to (170, 67).
; PLAN: r0=79(x), r1=176(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=467(x1), r6=192(y1), r7=170(x2), r8=67(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 79
LDI r1, 176
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 467
LDI r6, 192
LDI r7, 170
LDI r8, 67
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
