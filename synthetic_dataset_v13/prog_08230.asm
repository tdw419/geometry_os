; DESCRIPTION: Draws a green rectangle at (61, 207) with width 96 and height 45.
; PLAN: r0=61(x), r1=207(y), r2=96(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 207
LDI r2, 96
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
