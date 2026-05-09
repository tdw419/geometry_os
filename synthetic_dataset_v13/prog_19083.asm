; DESCRIPTION: Draws a blue rectangle at (245, 96) with width 17 and height 63.
; PLAN: r0=245(x), r1=96(y), r2=17(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 96
LDI r2, 17
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
