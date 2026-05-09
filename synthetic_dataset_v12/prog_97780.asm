; DESCRIPTION: Draws a blue rectangle at (204, 214) with width 65 and height 29.
; PLAN: r0=204(x), r1=214(y), r2=65(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 214
LDI r2, 65
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
