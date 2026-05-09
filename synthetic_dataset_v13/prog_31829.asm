; DESCRIPTION: Draws a purple rectangle at (57, 68) with width 109 and height 105.
; PLAN: r0=57(x), r1=68(y), r2=109(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 68
LDI r2, 109
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
