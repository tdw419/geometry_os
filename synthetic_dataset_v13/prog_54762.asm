; DESCRIPTION: Draws a green rectangle at (414, 3) with width 62 and height 96.
; PLAN: r0=414(x), r1=3(y), r2=62(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 3
LDI r2, 62
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
