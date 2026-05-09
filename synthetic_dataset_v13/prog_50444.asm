; DESCRIPTION: Draws a blue rectangle at (167, 124) with width 117 and height 67.
; PLAN: r0=167(x), r1=124(y), r2=117(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 124
LDI r2, 117
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
