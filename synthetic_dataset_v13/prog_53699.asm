; DESCRIPTION: Composite: Renders a orange box of size 117x62 starting at (91, 187) then Creates a purple circular shape at (348, 150) with radius 67.
; PLAN: r0=91(x), r1=187(y), r2=117(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x), r6=150(y), r7=67(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 91
LDI r1, 187
LDI r2, 117
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 150
LDI r7, 67
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
