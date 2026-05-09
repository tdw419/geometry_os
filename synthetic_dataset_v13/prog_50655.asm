; DESCRIPTION: Draws a green rectangle at (219, 207) with width 14 and height 27.
; PLAN: r0=219(x), r1=207(y), r2=14(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 207
LDI r2, 14
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
