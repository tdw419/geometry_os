; DESCRIPTION: Draws a black rectangle at (79, 177) with width 69 and height 53.
; PLAN: r0=79(x), r1=177(y), r2=69(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 177
LDI r2, 69
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
