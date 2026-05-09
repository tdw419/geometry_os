; DESCRIPTION: Draws a green rectangle at (15, 60) with width 28 and height 10.
; PLAN: r0=15(x), r1=60(y), r2=28(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 60
LDI r2, 28
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
