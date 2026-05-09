; DESCRIPTION: Draws a yellow rectangle at (72, 69) with width 39 and height 39.
; PLAN: r0=72(x), r1=69(y), r2=39(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 69
LDI r2, 39
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
