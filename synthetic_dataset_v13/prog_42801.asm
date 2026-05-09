; DESCRIPTION: Draws a purple rectangle at (415, 34) with width 63 and height 91.
; PLAN: r0=415(x), r1=34(y), r2=63(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 34
LDI r2, 63
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
