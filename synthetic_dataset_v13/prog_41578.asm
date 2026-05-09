; DESCRIPTION: Draws a orange rectangle at (337, 57) with width 33 and height 35.
; PLAN: r0=337(x), r1=57(y), r2=33(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 57
LDI r2, 33
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
