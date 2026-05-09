; DESCRIPTION: Draws a red rectangle at (201, 135) with width 46 and height 69.
; PLAN: r0=201(x), r1=135(y), r2=46(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 135
LDI r2, 46
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
