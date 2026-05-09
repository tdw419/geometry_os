; DESCRIPTION: Draws a purple rectangle at (470, 140) with width 34 and height 64.
; PLAN: r0=470(x), r1=140(y), r2=34(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 140
LDI r2, 34
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
