; DESCRIPTION: Draws a purple rectangle at (38, 144) with width 24 and height 65.
; PLAN: r0=38(x), r1=144(y), r2=24(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 144
LDI r2, 24
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
