; DESCRIPTION: Draws a green rectangle at (183, 28) with width 60 and height 117.
; PLAN: r0=183(x), r1=28(y), r2=60(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 28
LDI r2, 60
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
