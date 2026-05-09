; DESCRIPTION: Draws a blue rectangle at (328, 14) with width 90 and height 79.
; PLAN: r0=328(x), r1=14(y), r2=90(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 14
LDI r2, 90
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
