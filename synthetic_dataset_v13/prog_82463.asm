; DESCRIPTION: Draws a orange rectangle at (80, 55) with width 16 and height 19.
; PLAN: r0=80(x), r1=55(y), r2=16(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 55
LDI r2, 16
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
