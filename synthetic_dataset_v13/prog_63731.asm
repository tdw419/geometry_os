; DESCRIPTION: Draws a green rectangle at (469, 112) with width 13 and height 102.
; PLAN: r0=469(x), r1=112(y), r2=13(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 112
LDI r2, 13
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
