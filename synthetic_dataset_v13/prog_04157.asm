; DESCRIPTION: Draws a cyan rectangle at (344, 55) with width 52 and height 58.
; PLAN: r0=344(x), r1=55(y), r2=52(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 55
LDI r2, 52
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
