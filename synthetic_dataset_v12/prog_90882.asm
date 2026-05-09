; DESCRIPTION: Draws a red rectangle at (160, 175) with width 69 and height 54.
; PLAN: r0=160(x), r1=175(y), r2=69(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 175
LDI r2, 69
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
