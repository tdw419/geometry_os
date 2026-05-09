; DESCRIPTION: Draws a black rectangle at (60, 74) with width 68 and height 118.
; PLAN: r0=60(x), r1=74(y), r2=68(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 74
LDI r2, 68
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
