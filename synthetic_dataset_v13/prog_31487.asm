; DESCRIPTION: Draws a yellow rectangle at (207, 68) with width 67 and height 70.
; PLAN: r0=207(x), r1=68(y), r2=67(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 68
LDI r2, 67
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
