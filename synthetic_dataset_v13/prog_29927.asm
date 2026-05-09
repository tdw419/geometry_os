; DESCRIPTION: Draws a blue rectangle at (180, 9) with width 72 and height 103.
; PLAN: r0=180(x), r1=9(y), r2=72(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 9
LDI r2, 72
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
