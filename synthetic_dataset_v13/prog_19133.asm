; DESCRIPTION: Draws a green rectangle at (416, 207) with width 56 and height 24.
; PLAN: r0=416(x), r1=207(y), r2=56(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 207
LDI r2, 56
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
