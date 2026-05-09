; DESCRIPTION: Draws a blue rectangle at (165, 60) with width 85 and height 95.
; PLAN: r0=165(x), r1=60(y), r2=85(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 60
LDI r2, 85
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
