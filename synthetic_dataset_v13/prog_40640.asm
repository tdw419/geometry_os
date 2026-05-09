; DESCRIPTION: Draws a cyan rectangle at (49, 84) with width 39 and height 98.
; PLAN: r0=49(x), r1=84(y), r2=39(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 84
LDI r2, 39
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
