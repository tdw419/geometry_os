; DESCRIPTION: Draws a blue rectangle at (340, 45) with width 58 and height 105.
; PLAN: r0=340(x), r1=45(y), r2=58(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 45
LDI r2, 58
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
