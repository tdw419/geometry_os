; DESCRIPTION: Draws a blue rectangle at (2, 127) with width 50 and height 36.
; PLAN: r0=2(x), r1=127(y), r2=50(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 127
LDI r2, 50
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
