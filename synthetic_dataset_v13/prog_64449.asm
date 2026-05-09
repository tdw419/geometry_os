; DESCRIPTION: Composite: Creates a yellow rectangular region at (199, 13) spanning 36 by 40 pixels then Places a magenta line segment connecting (85, 179) to (275, 138).
; PLAN: r0=199(x), r1=13(y), r2=36(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x1), r6=179(y1), r7=275(x2), r8=138(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 199
LDI r1, 13
LDI r2, 36
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 179
LDI r7, 275
LDI r8, 138
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
