; DESCRIPTION: Draws a blue rectangle at (337, 62) with width 98 and height 117.
; PLAN: r0=337(x), r1=62(y), r2=98(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 62
LDI r2, 98
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
