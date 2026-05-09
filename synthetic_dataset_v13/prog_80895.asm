; DESCRIPTION: Draws a green rectangle at (192, 95) with width 62 and height 111.
; PLAN: r0=192(x), r1=95(y), r2=62(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 95
LDI r2, 62
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
