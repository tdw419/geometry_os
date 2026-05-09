; DESCRIPTION: Draws a black rectangle at (78, 149) with width 73 and height 75.
; PLAN: r0=78(x), r1=149(y), r2=73(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 149
LDI r2, 73
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
