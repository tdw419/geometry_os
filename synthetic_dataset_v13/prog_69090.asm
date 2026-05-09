; DESCRIPTION: Draws a blue rectangle at (175, 165) with width 120 and height 15.
; PLAN: r0=175(x), r1=165(y), r2=120(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 165
LDI r2, 120
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
