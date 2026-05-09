; DESCRIPTION: Draws a white rectangle at (414, 122) with width 45 and height 117.
; PLAN: r0=414(x), r1=122(y), r2=45(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 122
LDI r2, 45
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
