; DESCRIPTION: Draws a yellow rectangle at (403, 135) with width 67 and height 113.
; PLAN: r0=403(x), r1=135(y), r2=67(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 135
LDI r2, 67
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
