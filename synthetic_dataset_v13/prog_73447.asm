; DESCRIPTION: Draws a cyan rectangle at (314, 43) with width 58 and height 106.
; PLAN: r0=314(x), r1=43(y), r2=58(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 43
LDI r2, 58
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
