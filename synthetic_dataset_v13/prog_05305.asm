; DESCRIPTION: Draws a white rectangle at (191, 101) with width 86 and height 62.
; PLAN: r0=191(x), r1=101(y), r2=86(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 101
LDI r2, 86
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
