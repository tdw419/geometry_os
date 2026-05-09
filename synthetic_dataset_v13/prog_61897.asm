; DESCRIPTION: Draws a blue rectangle at (63, 32) with width 43 and height 104.
; PLAN: r0=63(x), r1=32(y), r2=43(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 32
LDI r2, 43
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
