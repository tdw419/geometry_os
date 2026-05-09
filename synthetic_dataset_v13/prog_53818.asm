; DESCRIPTION: Draws a yellow rectangle at (166, 109) with width 67 and height 60.
; PLAN: r0=166(x), r1=109(y), r2=67(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 109
LDI r2, 67
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
