; DESCRIPTION: Draws a cyan rectangle at (67, 49) with width 114 and height 77.
; PLAN: r0=67(x), r1=49(y), r2=114(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 49
LDI r2, 114
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
