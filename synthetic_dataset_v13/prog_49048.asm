; DESCRIPTION: Draws a green rectangle at (5, 117) with width 29 and height 103.
; PLAN: r0=5(x), r1=117(y), r2=29(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 117
LDI r2, 29
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
