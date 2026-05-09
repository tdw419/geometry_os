; DESCRIPTION: Draws a blue rectangle at (277, 158) with width 60 and height 78.
; PLAN: r0=277(x), r1=158(y), r2=60(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 158
LDI r2, 60
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
