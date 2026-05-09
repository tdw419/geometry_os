; DESCRIPTION: Draws a cyan rectangle at (232, 151) with width 10 and height 88.
; PLAN: r0=232(x), r1=151(y), r2=10(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 151
LDI r2, 10
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
