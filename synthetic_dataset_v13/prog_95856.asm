; DESCRIPTION: Draws a blue rectangle at (239, 50) with width 74 and height 56.
; PLAN: r0=239(x), r1=50(y), r2=74(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 50
LDI r2, 74
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
