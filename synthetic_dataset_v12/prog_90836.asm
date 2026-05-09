; DESCRIPTION: Draws a purple rectangle at (346, 188) with width 40 and height 34.
; PLAN: r0=346(x), r1=188(y), r2=40(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 188
LDI r2, 40
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
