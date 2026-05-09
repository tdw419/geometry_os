; DESCRIPTION: Draws a black rectangle at (174, 22) with width 85 and height 86.
; PLAN: r0=174(x), r1=22(y), r2=85(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 22
LDI r2, 85
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
