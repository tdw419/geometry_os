; DESCRIPTION: Draws a green rectangle at (28, 25) with width 60 and height 78.
; PLAN: r0=28(x), r1=25(y), r2=60(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 25
LDI r2, 60
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
