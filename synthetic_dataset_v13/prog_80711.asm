; DESCRIPTION: Draws a blue rectangle at (173, 80) with width 112 and height 68.
; PLAN: r0=173(x), r1=80(y), r2=112(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 80
LDI r2, 112
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
