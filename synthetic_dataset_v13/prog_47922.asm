; DESCRIPTION: Draws a yellow rectangle at (230, 124) with width 67 and height 32.
; PLAN: r0=230(x), r1=124(y), r2=67(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 124
LDI r2, 67
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
