; DESCRIPTION: Draws a blue rectangle at (214, 95) with width 48 and height 81.
; PLAN: r0=214(x), r1=95(y), r2=48(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 95
LDI r2, 48
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
