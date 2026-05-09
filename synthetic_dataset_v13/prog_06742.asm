; DESCRIPTION: Draws a blue rectangle at (27, 54) with width 76 and height 93.
; PLAN: r0=27(x), r1=54(y), r2=76(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 54
LDI r2, 76
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
