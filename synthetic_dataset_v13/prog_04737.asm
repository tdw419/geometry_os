; DESCRIPTION: Draws a blue rectangle at (20, 38) with width 95 and height 54.
; PLAN: r0=20(x), r1=38(y), r2=95(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 38
LDI r2, 95
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
