; DESCRIPTION: Composite: Draws a purple rectangle at (430, 113) with width 28 and height 74 then Draws a yellow line from (348, 148) to (128, 70).
; PLAN: r0=430(x), r1=113(y), r2=28(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x1), r6=148(y1), r7=128(x2), r8=70(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 430
LDI r1, 113
LDI r2, 28
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 148
LDI r7, 128
LDI r8, 70
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
