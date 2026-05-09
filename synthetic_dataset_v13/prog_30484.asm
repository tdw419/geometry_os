; DESCRIPTION: Draws a black rectangle at (217, 78) with width 95 and height 65.
; PLAN: r0=217(x), r1=78(y), r2=95(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 78
LDI r2, 95
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
