; DESCRIPTION: Draws a green rectangle at (69, 83) with width 98 and height 85.
; PLAN: r0=69(x), r1=83(y), r2=98(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 83
LDI r2, 98
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
