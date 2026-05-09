; DESCRIPTION: Draws a orange rectangle at (225, 33) with width 103 and height 99.
; PLAN: r0=225(x), r1=33(y), r2=103(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 33
LDI r2, 103
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
