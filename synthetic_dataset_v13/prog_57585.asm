; DESCRIPTION: Draws a cyan rectangle at (326, 88) with width 46 and height 73.
; PLAN: r0=326(x), r1=88(y), r2=46(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 88
LDI r2, 46
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
