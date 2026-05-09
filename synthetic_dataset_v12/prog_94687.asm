; DESCRIPTION: Draws a black rectangle at (49, 80) with width 65 and height 98.
; PLAN: r0=49(x), r1=80(y), r2=65(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 80
LDI r2, 65
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
