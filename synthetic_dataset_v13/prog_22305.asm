; DESCRIPTION: Draws a green rectangle at (303, 60) with width 101 and height 64.
; PLAN: r0=303(x), r1=60(y), r2=101(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 60
LDI r2, 101
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
