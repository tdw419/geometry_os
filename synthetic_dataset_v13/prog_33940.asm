; DESCRIPTION: Composite: Draws a magenta line from (196, 200) to (190, 38) then Creates a orange rectangular region at (261, 3) spanning 107 by 104 pixels.
; PLAN: r0=196(x1), r1=200(y1), r2=190(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=3(y), r7=107(width), r8=104(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 196
LDI r1, 200
LDI r2, 190
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 3
LDI r7, 107
LDI r8, 104
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
