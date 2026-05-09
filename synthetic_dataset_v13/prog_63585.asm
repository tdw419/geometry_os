; DESCRIPTION: Composite: Places a white line segment connecting (45, 173) to (9, 153) then Creates a red rectangular region at (344, 8) spanning 99 by 73 pixels.
; PLAN: r0=45(x1), r1=173(y1), r2=9(x2), r3=153(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=344(x), r6=8(y), r7=99(width), r8=73(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 45
LDI r1, 173
LDI r2, 9
LDI r3, 153
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 8
LDI r7, 99
LDI r8, 73
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
