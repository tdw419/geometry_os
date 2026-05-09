; DESCRIPTION: Draws a orange rectangle at (295, 122) with width 49 and height 86.
; PLAN: r0=295(x), r1=122(y), r2=49(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 122
LDI r2, 49
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
