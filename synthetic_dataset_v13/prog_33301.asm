; DESCRIPTION: Composite: Places a magenta line segment connecting (246, 113) to (511, 9) then Creates a green rectangular region at (103, 15) spanning 94 by 11 pixels.
; PLAN: r0=246(x1), r1=113(y1), r2=511(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=15(y), r7=94(width), r8=11(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 246
LDI r1, 113
LDI r2, 511
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 15
LDI r7, 94
LDI r8, 11
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
