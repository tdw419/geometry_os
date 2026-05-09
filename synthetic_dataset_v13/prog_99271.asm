; DESCRIPTION: Draws a red rectangle at (303, 158) with width 23 and height 40.
; PLAN: r0=303(x), r1=158(y), r2=23(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 158
LDI r2, 23
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
