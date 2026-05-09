; DESCRIPTION: Draws a yellow rectangle at (360, 98) with width 105 and height 75.
; PLAN: r0=360(x), r1=98(y), r2=105(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 98
LDI r2, 105
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
