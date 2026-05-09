; DESCRIPTION: Draws a blue rectangle at (409, 22) with width 85 and height 57.
; PLAN: r0=409(x), r1=22(y), r2=85(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 22
LDI r2, 85
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
