; DESCRIPTION: Draws a yellow rectangle at (35, 116) with width 67 and height 48.
; PLAN: r0=35(x), r1=116(y), r2=67(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 116
LDI r2, 67
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
