; DESCRIPTION: Draws a blue rectangle at (43, 150) with width 40 and height 76.
; PLAN: r0=43(x), r1=150(y), r2=40(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 150
LDI r2, 40
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
