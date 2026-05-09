; DESCRIPTION: Draws a black rectangle at (295, 6) with width 67 and height 76.
; PLAN: r0=295(x), r1=6(y), r2=67(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 6
LDI r2, 67
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
