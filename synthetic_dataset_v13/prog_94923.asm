; DESCRIPTION: Draws a green rectangle at (97, 124) with width 95 and height 71.
; PLAN: r0=97(x), r1=124(y), r2=95(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 124
LDI r2, 95
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
