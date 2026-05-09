; DESCRIPTION: Draws a orange rectangle at (295, 158) with width 98 and height 26.
; PLAN: r0=295(x), r1=158(y), r2=98(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 158
LDI r2, 98
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
