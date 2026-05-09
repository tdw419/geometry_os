; DESCRIPTION: Draws a white rectangle at (60, 62) with width 58 and height 78.
; PLAN: r0=60(x), r1=62(y), r2=58(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 62
LDI r2, 58
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
