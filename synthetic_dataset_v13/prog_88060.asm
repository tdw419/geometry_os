; DESCRIPTION: Draws a red rectangle at (216, 30) with width 75 and height 19.
; PLAN: r0=216(x), r1=30(y), r2=75(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 30
LDI r2, 75
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
