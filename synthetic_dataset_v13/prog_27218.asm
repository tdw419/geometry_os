; DESCRIPTION: Draws a black rectangle at (213, 133) with width 74 and height 60.
; PLAN: r0=213(x), r1=133(y), r2=74(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 133
LDI r2, 74
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
