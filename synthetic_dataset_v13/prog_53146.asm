; DESCRIPTION: Draws a green rectangle at (130, 4) with width 54 and height 48.
; PLAN: r0=130(x), r1=4(y), r2=54(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 4
LDI r2, 54
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
