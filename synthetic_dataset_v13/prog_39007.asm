; DESCRIPTION: Draws a yellow rectangle at (75, 70) with width 57 and height 110.
; PLAN: r0=75(x), r1=70(y), r2=57(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 70
LDI r2, 57
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
