; DESCRIPTION: Draws a green rectangle at (115, 26) with width 50 and height 83.
; PLAN: r0=115(x), r1=26(y), r2=50(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 26
LDI r2, 50
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
