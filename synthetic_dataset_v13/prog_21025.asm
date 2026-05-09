; DESCRIPTION: Draws a blue rectangle at (206, 46) with width 88 and height 120.
; PLAN: r0=206(x), r1=46(y), r2=88(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 46
LDI r2, 88
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
