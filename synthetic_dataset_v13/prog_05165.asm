; DESCRIPTION: Draws a white rectangle at (316, 2) with width 58 and height 60.
; PLAN: r0=316(x), r1=2(y), r2=58(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 2
LDI r2, 58
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
