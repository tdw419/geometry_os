; DESCRIPTION: Draws a cyan rectangle at (319, 43) with width 11 and height 80.
; PLAN: r0=319(x), r1=43(y), r2=11(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 43
LDI r2, 11
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
