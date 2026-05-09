; DESCRIPTION: Draws a green rectangle at (165, 58) with width 98 and height 97.
; PLAN: r0=165(x), r1=58(y), r2=98(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 58
LDI r2, 98
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
