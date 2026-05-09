; DESCRIPTION: Draws a blue rectangle at (107, 70) with width 58 and height 34.
; PLAN: r0=107(x), r1=70(y), r2=58(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 70
LDI r2, 58
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
