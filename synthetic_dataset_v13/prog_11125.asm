; DESCRIPTION: Composite: Creates a purple circular shape at (175, 50) with radius 14 then Draws a white rectangle at (280, 91) with width 113 and height 82.
; PLAN: r0=175(x), r1=50(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=280(x), r6=91(y), r7=113(width), r8=82(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 175
LDI r1, 50
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 280
LDI r6, 91
LDI r7, 113
LDI r8, 82
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
