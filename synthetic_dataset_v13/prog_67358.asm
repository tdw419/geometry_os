; DESCRIPTION: Draws a orange rectangle at (318, 138) with width 120 and height 57.
; PLAN: r0=318(x), r1=138(y), r2=120(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 138
LDI r2, 120
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
