; DESCRIPTION: Draws a cyan rectangle at (28, 14) with width 17 and height 26.
; PLAN: r0=28(x), r1=14(y), r2=17(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 14
LDI r2, 17
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
