; DESCRIPTION: Draws a blue rectangle at (329, 95) with width 103 and height 79.
; PLAN: r0=329(x), r1=95(y), r2=103(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 95
LDI r2, 103
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
