; DESCRIPTION: Draws a red rectangle at (22, 113) with width 115 and height 40.
; PLAN: r0=22(x), r1=113(y), r2=115(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 113
LDI r2, 115
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
