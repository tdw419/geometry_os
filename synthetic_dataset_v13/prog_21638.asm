; DESCRIPTION: Draws a blue rectangle at (387, 86) with width 29 and height 23.
; PLAN: r0=387(x), r1=86(y), r2=29(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 86
LDI r2, 29
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
