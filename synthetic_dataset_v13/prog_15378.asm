; DESCRIPTION: Draws a cyan rectangle at (227, 15) with width 60 and height 84.
; PLAN: r0=227(x), r1=15(y), r2=60(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 15
LDI r2, 60
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
