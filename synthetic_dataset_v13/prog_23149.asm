; DESCRIPTION: Composite: Creates a purple circular shape at (307, 116) with radius 80 then Draws a white rectangle at (14, 72) with width 85 and height 109.
; PLAN: r0=307(x), r1=116(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=14(x), r6=72(y), r7=85(width), r8=109(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 116
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 14
LDI r6, 72
LDI r7, 85
LDI r8, 109
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
