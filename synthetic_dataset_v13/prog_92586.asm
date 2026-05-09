; DESCRIPTION: Draws a cyan rectangle at (319, 84) with width 54 and height 93.
; PLAN: r0=319(x), r1=84(y), r2=54(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 84
LDI r2, 54
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
