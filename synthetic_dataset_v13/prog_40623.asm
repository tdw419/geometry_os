; DESCRIPTION: Draws a blue rectangle at (435, 3) with width 58 and height 64.
; PLAN: r0=435(x), r1=3(y), r2=58(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 3
LDI r2, 58
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
