; DESCRIPTION: Draws a green rectangle at (57, 154) with width 30 and height 15.
; PLAN: r0=57(x), r1=154(y), r2=30(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 154
LDI r2, 30
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
