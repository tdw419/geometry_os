; DESCRIPTION: Draws a blue rectangle at (278, 90) with width 46 and height 19.
; PLAN: r0=278(x), r1=90(y), r2=46(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 90
LDI r2, 46
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
