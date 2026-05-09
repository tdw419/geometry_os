; DESCRIPTION: Draws a orange rectangle at (305, 62) with width 92 and height 99.
; PLAN: r0=305(x), r1=62(y), r2=92(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 62
LDI r2, 92
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
