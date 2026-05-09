; DESCRIPTION: Draws a green rectangle at (162, 66) with width 67 and height 48.
; PLAN: r0=162(x), r1=66(y), r2=67(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 66
LDI r2, 67
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
