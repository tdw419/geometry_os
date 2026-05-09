; DESCRIPTION: Draws a purple rectangle at (18, 61) with width 50 and height 115.
; PLAN: r0=18(x), r1=61(y), r2=50(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 61
LDI r2, 50
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
