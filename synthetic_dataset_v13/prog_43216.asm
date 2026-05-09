; DESCRIPTION: Draws a red rectangle at (11, 40) with width 26 and height 25.
; PLAN: r0=11(x), r1=40(y), r2=26(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 40
LDI r2, 26
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
