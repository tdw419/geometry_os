; DESCRIPTION: Draws a blue rectangle at (136, 214) with width 32 and height 39.
; PLAN: r0=136(x), r1=214(y), r2=32(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 214
LDI r2, 32
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
