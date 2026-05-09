; DESCRIPTION: Draws a green rectangle at (337, 135) with width 18 and height 38.
; PLAN: r0=337(x), r1=135(y), r2=18(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 135
LDI r2, 18
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
