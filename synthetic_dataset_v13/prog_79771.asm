; DESCRIPTION: Draws a blue rectangle at (173, 18) with width 63 and height 18.
; PLAN: r0=173(x), r1=18(y), r2=63(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 18
LDI r2, 63
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
