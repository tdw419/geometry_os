; DESCRIPTION: Draws a blue rectangle at (340, 164) with width 79 and height 55.
; PLAN: r0=340(x), r1=164(y), r2=79(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 164
LDI r2, 79
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
