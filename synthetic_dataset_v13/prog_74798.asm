; DESCRIPTION: Draws a blue rectangle at (141, 117) with width 112 and height 60.
; PLAN: r0=141(x), r1=117(y), r2=112(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 117
LDI r2, 112
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
