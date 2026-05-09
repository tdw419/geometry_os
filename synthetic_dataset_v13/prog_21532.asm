; DESCRIPTION: Draws a green rectangle at (306, 112) with width 49 and height 31.
; PLAN: r0=306(x), r1=112(y), r2=49(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 112
LDI r2, 49
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
