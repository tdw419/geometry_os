; DESCRIPTION: Draws a orange rectangle at (334, 59) with width 107 and height 80.
; PLAN: r0=334(x), r1=59(y), r2=107(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 59
LDI r2, 107
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
