; DESCRIPTION: Draws a red rectangle at (306, 120) with width 114 and height 54.
; PLAN: r0=306(x), r1=120(y), r2=114(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 120
LDI r2, 114
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
