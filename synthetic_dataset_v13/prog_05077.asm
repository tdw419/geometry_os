; DESCRIPTION: Draws a purple rectangle at (154, 57) with width 31 and height 114.
; PLAN: r0=154(x), r1=57(y), r2=31(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 57
LDI r2, 31
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
