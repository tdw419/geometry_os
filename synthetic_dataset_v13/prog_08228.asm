; DESCRIPTION: Composite: Places a magenta line segment connecting (268, 160) to (225, 212) then Creates a white rectangular region at (321, 103) spanning 76 by 85 pixels.
; PLAN: r0=268(x1), r1=160(y1), r2=225(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=321(x), r6=103(y), r7=76(width), r8=85(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 268
LDI r1, 160
LDI r2, 225
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 103
LDI r7, 76
LDI r8, 85
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
