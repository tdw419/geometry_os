; DESCRIPTION: Draws a blue rectangle at (282, 93) with width 38 and height 36.
; PLAN: r0=282(x), r1=93(y), r2=38(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 93
LDI r2, 38
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
