; DESCRIPTION: Draws a cyan rectangle at (344, 91) with width 74 and height 62.
; PLAN: r0=344(x), r1=91(y), r2=74(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 91
LDI r2, 74
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
