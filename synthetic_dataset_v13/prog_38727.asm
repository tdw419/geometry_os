; DESCRIPTION: Draws a blue rectangle at (306, 98) with width 102 and height 95.
; PLAN: r0=306(x), r1=98(y), r2=102(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 98
LDI r2, 102
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
