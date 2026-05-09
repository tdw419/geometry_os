; DESCRIPTION: Draws a red rectangle at (333, 90) with width 118 and height 66.
; PLAN: r0=333(x), r1=90(y), r2=118(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 90
LDI r2, 118
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
