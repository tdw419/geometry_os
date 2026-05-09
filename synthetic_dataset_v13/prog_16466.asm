; DESCRIPTION: Draws a red rectangle at (217, 162) with width 69 and height 20.
; PLAN: r0=217(x), r1=162(y), r2=69(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 162
LDI r2, 69
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
