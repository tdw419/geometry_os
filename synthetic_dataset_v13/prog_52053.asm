; DESCRIPTION: Draws a cyan rectangle at (244, 36) with width 33 and height 88.
; PLAN: r0=244(x), r1=36(y), r2=33(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 36
LDI r2, 33
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
