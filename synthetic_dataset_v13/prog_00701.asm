; DESCRIPTION: Draws a magenta rectangle at (59, 33) with width 112 and height 41.
; PLAN: r0=59(x), r1=33(y), r2=112(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 33
LDI r2, 112
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
