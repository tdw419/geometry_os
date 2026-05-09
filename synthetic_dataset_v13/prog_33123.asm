; DESCRIPTION: Draws a blue rectangle at (143, 53) with width 21 and height 74.
; PLAN: r0=143(x), r1=53(y), r2=21(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 53
LDI r2, 21
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
