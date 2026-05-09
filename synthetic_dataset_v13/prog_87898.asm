; DESCRIPTION: Draws a cyan rectangle at (149, 207) with width 34 and height 38.
; PLAN: r0=149(x), r1=207(y), r2=34(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 207
LDI r2, 34
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
