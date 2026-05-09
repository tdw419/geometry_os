; DESCRIPTION: Composite: Places a orange line segment connecting (202, 106) to (17, 28) then Creates a orange rectangular region at (344, 144) spanning 53 by 38 pixels.
; PLAN: r0=202(x1), r1=106(y1), r2=17(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=344(x), r6=144(y), r7=53(width), r8=38(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 106
LDI r2, 17
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 144
LDI r7, 53
LDI r8, 38
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
