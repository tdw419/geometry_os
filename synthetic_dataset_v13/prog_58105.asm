; DESCRIPTION: Draws a cyan rectangle at (222, 49) with width 88 and height 111.
; PLAN: r0=222(x), r1=49(y), r2=88(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 49
LDI r2, 88
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
