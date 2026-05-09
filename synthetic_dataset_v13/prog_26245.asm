; DESCRIPTION: Draws a blue rectangle at (327, 72) with width 20 and height 65.
; PLAN: r0=327(x), r1=72(y), r2=20(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 72
LDI r2, 20
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
