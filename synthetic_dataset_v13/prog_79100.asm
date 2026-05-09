; DESCRIPTION: Composite: Draws a magenta line from (494, 201) to (110, 20) then Creates a white rectangular region at (110, 33) spanning 101 by 90 pixels.
; PLAN: r0=494(x1), r1=201(y1), r2=110(x2), r3=20(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=110(x), r6=33(y), r7=101(width), r8=90(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 494
LDI r1, 201
LDI r2, 110
LDI r3, 20
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 33
LDI r7, 101
LDI r8, 90
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
