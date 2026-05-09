; DESCRIPTION: Draws a blue rectangle at (32, 125) with width 31 and height 113.
; PLAN: r0=32(x), r1=125(y), r2=31(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 125
LDI r2, 31
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
