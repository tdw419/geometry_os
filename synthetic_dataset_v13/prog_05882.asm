; DESCRIPTION: Draws a green rectangle at (24, 4) with width 50 and height 78.
; PLAN: r0=24(x), r1=4(y), r2=50(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 4
LDI r2, 50
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
