; DESCRIPTION: Draws a green rectangle at (60, 45) with width 75 and height 46.
; PLAN: r0=60(x), r1=45(y), r2=75(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 45
LDI r2, 75
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
