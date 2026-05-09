; DESCRIPTION: Draws a green rectangle at (27, 122) with width 57 and height 25.
; PLAN: r0=27(x), r1=122(y), r2=57(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 122
LDI r2, 57
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
