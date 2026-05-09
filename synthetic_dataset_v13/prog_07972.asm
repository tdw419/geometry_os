; DESCRIPTION: Composite: Places a blue line segment connecting (10, 199) to (14, 101) then Creates a orange rectangular region at (5, 20) spanning 45 by 54 pixels.
; PLAN: r0=10(x1), r1=199(y1), r2=14(x2), r3=101(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=5(x), r6=20(y), r7=45(width), r8=54(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 10
LDI r1, 199
LDI r2, 14
LDI r3, 101
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 20
LDI r7, 45
LDI r8, 54
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
