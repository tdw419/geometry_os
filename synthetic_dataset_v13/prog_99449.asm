; DESCRIPTION: Draws a blue rectangle at (333, 105) with width 47 and height 63.
; PLAN: r0=333(x), r1=105(y), r2=47(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 105
LDI r2, 47
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
