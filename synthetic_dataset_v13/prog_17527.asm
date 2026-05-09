; DESCRIPTION: Draws a orange rectangle at (298, 88) with width 68 and height 25.
; PLAN: r0=298(x), r1=88(y), r2=68(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 88
LDI r2, 68
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
