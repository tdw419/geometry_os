; DESCRIPTION: Draws a cyan rectangle at (153, 67) with width 89 and height 49.
; PLAN: r0=153(x), r1=67(y), r2=89(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 67
LDI r2, 89
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
