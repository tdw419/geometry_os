; DESCRIPTION: Draws a purple rectangle at (146, 114) with width 85 and height 11.
; PLAN: r0=146(x), r1=114(y), r2=85(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 114
LDI r2, 85
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
