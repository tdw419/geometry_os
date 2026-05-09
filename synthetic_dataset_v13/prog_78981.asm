; DESCRIPTION: Draws a cyan rectangle at (67, 15) with width 58 and height 60.
; PLAN: r0=67(x), r1=15(y), r2=58(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 15
LDI r2, 58
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
