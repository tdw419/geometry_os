; DESCRIPTION: Composite: Creates a red rectangular region at (422, 19) spanning 16 by 60 pixels then Draws a orange line from (395, 28) to (173, 62).
; PLAN: r0=422(x), r1=19(y), r2=16(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=395(x1), r6=28(y1), r7=173(x2), r8=62(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 19
LDI r2, 16
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 28
LDI r7, 173
LDI r8, 62
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
