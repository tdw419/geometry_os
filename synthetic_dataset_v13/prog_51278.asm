; DESCRIPTION: Draws a green rectangle at (6, 69) with width 59 and height 111.
; PLAN: r0=6(x), r1=69(y), r2=59(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 69
LDI r2, 59
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
