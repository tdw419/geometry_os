; DESCRIPTION: Draws a blue rectangle at (60, 135) with width 50 and height 45.
; PLAN: r0=60(x), r1=135(y), r2=50(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 135
LDI r2, 50
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
