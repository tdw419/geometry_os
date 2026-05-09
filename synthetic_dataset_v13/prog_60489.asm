; DESCRIPTION: Draws a orange rectangle at (127, 34) with width 70 and height 16.
; PLAN: r0=127(x), r1=34(y), r2=70(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 34
LDI r2, 70
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
