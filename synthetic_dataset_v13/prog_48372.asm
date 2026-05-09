; DESCRIPTION: Draws a yellow rectangle at (153, 121) with width 120 and height 67.
; PLAN: r0=153(x), r1=121(y), r2=120(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 121
LDI r2, 120
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
