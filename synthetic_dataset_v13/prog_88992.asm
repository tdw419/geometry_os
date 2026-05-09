; DESCRIPTION: Draws a purple rectangle at (140, 27) with width 97 and height 120.
; PLAN: r0=140(x), r1=27(y), r2=97(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 27
LDI r2, 97
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
