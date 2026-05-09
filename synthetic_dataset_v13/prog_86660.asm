; DESCRIPTION: Draws a purple rectangle at (178, 97) with width 120 and height 27.
; PLAN: r0=178(x), r1=97(y), r2=120(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 97
LDI r2, 120
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
