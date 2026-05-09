; DESCRIPTION: Draws a red rectangle at (148, 185) with width 69 and height 68.
; PLAN: r0=148(x), r1=185(y), r2=69(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 185
LDI r2, 69
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
