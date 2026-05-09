; DESCRIPTION: Draws a cyan rectangle at (167, 88) with width 86 and height 84.
; PLAN: r0=167(x), r1=88(y), r2=86(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 88
LDI r2, 86
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
