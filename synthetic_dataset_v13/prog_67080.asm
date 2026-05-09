; DESCRIPTION: Draws a cyan rectangle at (122, 86) with width 11 and height 49.
; PLAN: r0=122(x), r1=86(y), r2=11(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 86
LDI r2, 11
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
