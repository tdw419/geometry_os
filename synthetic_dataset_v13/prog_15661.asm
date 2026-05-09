; DESCRIPTION: Composite: Draws a magenta line from (18, 233) to (498, 20) then Creates a green rectangular region at (67, 101) spanning 33 by 84 pixels.
; PLAN: r0=18(x1), r1=233(y1), r2=498(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=67(x), r6=101(y), r7=33(width), r8=84(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 18
LDI r1, 233
LDI r2, 498
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 101
LDI r7, 33
LDI r8, 84
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
