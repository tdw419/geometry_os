; DESCRIPTION: Draws a white rectangle at (118, 149) with width 102 and height 96.
; PLAN: r0=118(x), r1=149(y), r2=102(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 149
LDI r2, 102
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
