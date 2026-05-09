; DESCRIPTION: Draws a green rectangle at (177, 33) with width 13 and height 85.
; PLAN: r0=177(x), r1=33(y), r2=13(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 33
LDI r2, 13
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
