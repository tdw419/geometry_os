; DESCRIPTION: Draws a red rectangle at (306, 59) with width 74 and height 98.
; PLAN: r0=306(x), r1=59(y), r2=74(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 59
LDI r2, 74
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
