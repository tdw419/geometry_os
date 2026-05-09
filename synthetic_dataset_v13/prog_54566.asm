; DESCRIPTION: Draws a orange rectangle at (178, 121) with width 99 and height 65.
; PLAN: r0=178(x), r1=121(y), r2=99(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 121
LDI r2, 99
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
