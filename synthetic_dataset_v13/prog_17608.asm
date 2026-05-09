; DESCRIPTION: Draws a cyan rectangle at (76, 162) with width 26 and height 62.
; PLAN: r0=76(x), r1=162(y), r2=26(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 162
LDI r2, 26
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
