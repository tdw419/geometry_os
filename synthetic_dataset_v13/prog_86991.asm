; DESCRIPTION: Composite: Places a red line segment connecting (143, 162) to (491, 69) then Creates a orange rectangular region at (219, 9) spanning 75 by 70 pixels.
; PLAN: r0=143(x1), r1=162(y1), r2=491(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=219(x), r6=9(y), r7=75(width), r8=70(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 162
LDI r2, 491
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 9
LDI r7, 75
LDI r8, 70
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
