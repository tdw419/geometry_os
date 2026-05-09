; DESCRIPTION: Draws a blue rectangle at (197, 60) with width 55 and height 62.
; PLAN: r0=197(x), r1=60(y), r2=55(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 60
LDI r2, 55
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
