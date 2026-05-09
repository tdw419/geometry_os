; DESCRIPTION: Draws a green rectangle at (59, 10) with width 24 and height 74.
; PLAN: r0=59(x), r1=10(y), r2=24(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 10
LDI r2, 24
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
