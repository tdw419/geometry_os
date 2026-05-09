; DESCRIPTION: Draws a blue rectangle at (237, 16) with width 33 and height 78.
; PLAN: r0=237(x), r1=16(y), r2=33(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 16
LDI r2, 33
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
