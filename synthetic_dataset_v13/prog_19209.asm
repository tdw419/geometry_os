; DESCRIPTION: Draws a cyan rectangle at (319, 70) with width 54 and height 38.
; PLAN: r0=319(x), r1=70(y), r2=54(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 70
LDI r2, 54
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
