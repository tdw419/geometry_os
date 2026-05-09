; DESCRIPTION: Draws a purple rectangle at (34, 154) with width 75 and height 61.
; PLAN: r0=34(x), r1=154(y), r2=75(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 154
LDI r2, 75
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
