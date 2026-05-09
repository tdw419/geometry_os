; DESCRIPTION: Draws a blue rectangle at (374, 21) with width 79 and height 10.
; PLAN: r0=374(x), r1=21(y), r2=79(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 21
LDI r2, 79
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
