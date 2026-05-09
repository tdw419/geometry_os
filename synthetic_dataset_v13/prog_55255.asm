; DESCRIPTION: Draws a cyan rectangle at (122, 34) with width 22 and height 117.
; PLAN: r0=122(x), r1=34(y), r2=22(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 34
LDI r2, 22
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
