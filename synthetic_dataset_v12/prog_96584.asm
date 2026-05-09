; DESCRIPTION: Draws a purple rectangle at (33, 146) with width 103 and height 56.
; PLAN: r0=33(x), r1=146(y), r2=103(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 146
LDI r2, 103
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
