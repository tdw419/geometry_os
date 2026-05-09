; DESCRIPTION: Draws a cyan rectangle at (288, 24) with width 15 and height 43.
; PLAN: r0=288(x), r1=24(y), r2=15(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 24
LDI r2, 15
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
