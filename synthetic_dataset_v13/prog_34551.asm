; DESCRIPTION: Composite: Draws a orange line from (426, 171) to (154, 96) then Creates a red rectangular region at (288, 49) spanning 113 by 103 pixels.
; PLAN: r0=426(x1), r1=171(y1), r2=154(x2), r3=96(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=49(y), r7=113(width), r8=103(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 426
LDI r1, 171
LDI r2, 154
LDI r3, 96
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 49
LDI r7, 113
LDI r8, 103
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
