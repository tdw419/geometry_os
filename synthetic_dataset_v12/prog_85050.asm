; DESCRIPTION: Draws a green rectangle at (72, 5) with width 68 and height 98.
; PLAN: r0=72(x), r1=5(y), r2=68(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 5
LDI r2, 68
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
