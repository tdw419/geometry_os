; DESCRIPTION: Draws a red rectangle at (67, 64) with width 31 and height 35.
; PLAN: r0=67(x), r1=64(y), r2=31(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 64
LDI r2, 31
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
