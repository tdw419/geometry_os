; DESCRIPTION: Draws a blue rectangle at (115, 58) with width 62 and height 68.
; PLAN: r0=115(x), r1=58(y), r2=62(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 58
LDI r2, 62
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
