; DESCRIPTION: Draws a orange rectangle at (166, 143) with width 26 and height 70.
; PLAN: r0=166(x), r1=143(y), r2=26(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 143
LDI r2, 26
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
