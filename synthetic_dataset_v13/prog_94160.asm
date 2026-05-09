; DESCRIPTION: Draws a purple rectangle at (346, 220) with width 118 and height 31.
; PLAN: r0=346(x), r1=220(y), r2=118(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 220
LDI r2, 118
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
