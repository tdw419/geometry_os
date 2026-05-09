; DESCRIPTION: Draws a cyan rectangle at (161, 2) with width 21 and height 88.
; PLAN: r0=161(x), r1=2(y), r2=21(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 2
LDI r2, 21
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
