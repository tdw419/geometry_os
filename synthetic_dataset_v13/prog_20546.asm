; DESCRIPTION: Draws a orange rectangle at (229, 139) with width 48 and height 99.
; PLAN: r0=229(x), r1=139(y), r2=48(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 139
LDI r2, 48
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
