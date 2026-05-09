; DESCRIPTION: Draws a yellow rectangle at (28, 185) with width 16 and height 62.
; PLAN: r0=28(x), r1=185(y), r2=16(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 185
LDI r2, 16
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
