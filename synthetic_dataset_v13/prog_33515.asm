; DESCRIPTION: Draws a red rectangle at (59, 111) with width 83 and height 88.
; PLAN: r0=59(x), r1=111(y), r2=83(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 111
LDI r2, 83
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
