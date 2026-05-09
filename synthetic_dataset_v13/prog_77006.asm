; DESCRIPTION: Draws a yellow rectangle at (180, 175) with width 110 and height 11.
; PLAN: r0=180(x), r1=175(y), r2=110(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 175
LDI r2, 110
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
