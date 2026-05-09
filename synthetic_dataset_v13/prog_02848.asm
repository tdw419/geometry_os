; DESCRIPTION: Draws a cyan rectangle at (291, 49) with width 62 and height 111.
; PLAN: r0=291(x), r1=49(y), r2=62(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 49
LDI r2, 62
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
