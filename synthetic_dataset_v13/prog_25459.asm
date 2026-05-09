; DESCRIPTION: Draws a blue rectangle at (81, 229) with width 72 and height 20.
; PLAN: r0=81(x), r1=229(y), r2=72(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 229
LDI r2, 72
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
