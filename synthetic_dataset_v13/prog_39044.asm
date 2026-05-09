; DESCRIPTION: Draws a green rectangle at (71, 58) with width 56 and height 115.
; PLAN: r0=71(x), r1=58(y), r2=56(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 58
LDI r2, 56
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
