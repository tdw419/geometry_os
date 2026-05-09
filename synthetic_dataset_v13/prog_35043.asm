; DESCRIPTION: Draws a blue rectangle at (264, 222) with width 120 and height 19.
; PLAN: r0=264(x), r1=222(y), r2=120(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 222
LDI r2, 120
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
