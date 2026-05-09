; DESCRIPTION: Draws a green rectangle at (249, 77) with width 72 and height 117.
; PLAN: r0=249(x), r1=77(y), r2=72(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 77
LDI r2, 72
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
