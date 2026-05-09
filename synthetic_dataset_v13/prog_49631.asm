; DESCRIPTION: Composite: Creates a green rectangular region at (326, 57) spanning 22 by 22 pixels then Draws a orange line from (187, 172) to (420, 22).
; PLAN: r0=326(x), r1=57(y), r2=22(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=187(x1), r6=172(y1), r7=420(x2), r8=22(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 326
LDI r1, 57
LDI r2, 22
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 172
LDI r7, 420
LDI r8, 22
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
