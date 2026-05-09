; DESCRIPTION: Draws a blue rectangle at (271, 50) with width 40 and height 95.
; PLAN: r0=271(x), r1=50(y), r2=40(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 50
LDI r2, 40
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
