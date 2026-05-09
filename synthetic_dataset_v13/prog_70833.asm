; DESCRIPTION: Draws a magenta rectangle at (403, 121) with width 67 and height 113.
; PLAN: r0=403(x), r1=121(y), r2=67(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 121
LDI r2, 67
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
