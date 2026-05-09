; DESCRIPTION: Draws a cyan rectangle at (292, 67) with width 88 and height 19.
; PLAN: r0=292(x), r1=67(y), r2=88(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 67
LDI r2, 88
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
