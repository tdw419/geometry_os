; DESCRIPTION: Draws a blue rectangle at (314, 16) with width 49 and height 113.
; PLAN: r0=314(x), r1=16(y), r2=49(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 16
LDI r2, 49
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
