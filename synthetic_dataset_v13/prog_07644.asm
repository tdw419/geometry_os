; DESCRIPTION: Draws a orange rectangle at (2, 62) with width 92 and height 85.
; PLAN: r0=2(x), r1=62(y), r2=92(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 62
LDI r2, 92
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
