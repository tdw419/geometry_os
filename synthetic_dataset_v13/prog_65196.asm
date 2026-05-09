; DESCRIPTION: Draws a cyan rectangle at (188, 74) with width 88 and height 91.
; PLAN: r0=188(x), r1=74(y), r2=88(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 74
LDI r2, 88
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
