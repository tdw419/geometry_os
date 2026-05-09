; DESCRIPTION: Draws a white rectangle at (49, 60) with width 54 and height 101.
; PLAN: r0=49(x), r1=60(y), r2=54(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 60
LDI r2, 54
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
