; DESCRIPTION: Composite: Places a white line segment connecting (484, 173) to (290, 183) then Creates a magenta rectangular region at (284, 85) spanning 119 by 105 pixels.
; PLAN: r0=484(x1), r1=173(y1), r2=290(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=284(x), r6=85(y), r7=119(width), r8=105(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 484
LDI r1, 173
LDI r2, 290
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 85
LDI r7, 119
LDI r8, 105
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
