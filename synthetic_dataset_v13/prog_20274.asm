; DESCRIPTION: Draws a white rectangle at (108, 103) with width 59 and height 118.
; PLAN: r0=108(x), r1=103(y), r2=59(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 103
LDI r2, 59
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
