; DESCRIPTION: Draws a cyan rectangle at (0, 135) with width 71 and height 67.
; PLAN: r0=0(x), r1=135(y), r2=71(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 135
LDI r2, 71
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
