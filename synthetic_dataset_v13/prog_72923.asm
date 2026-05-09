; DESCRIPTION: Draws a purple rectangle at (306, 146) with width 74 and height 50.
; PLAN: r0=306(x), r1=146(y), r2=74(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 146
LDI r2, 74
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
