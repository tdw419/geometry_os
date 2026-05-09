; DESCRIPTION: Draws a black rectangle at (350, 75) with width 116 and height 102.
; PLAN: r0=350(x), r1=75(y), r2=116(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 75
LDI r2, 116
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
