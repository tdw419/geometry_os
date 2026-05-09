; DESCRIPTION: Draws a yellow rectangle at (217, 74) with width 69 and height 30.
; PLAN: r0=217(x), r1=74(y), r2=69(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 74
LDI r2, 69
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
