; DESCRIPTION: Draws a blue rectangle at (126, 95) with width 64 and height 100.
; PLAN: r0=126(x), r1=95(y), r2=64(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 95
LDI r2, 64
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
