; DESCRIPTION: Draws a blue rectangle at (333, 48) with width 78 and height 49.
; PLAN: r0=333(x), r1=48(y), r2=78(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 48
LDI r2, 78
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
