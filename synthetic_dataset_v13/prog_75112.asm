; DESCRIPTION: Composite: Places a orange line segment connecting (120, 5) to (432, 106) then Creates a red rectangular region at (350, 59) spanning 16 by 62 pixels.
; PLAN: r0=120(x1), r1=5(y1), r2=432(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=59(y), r7=16(width), r8=62(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 120
LDI r1, 5
LDI r2, 432
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 59
LDI r7, 16
LDI r8, 62
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
