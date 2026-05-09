; DESCRIPTION: Draws a orange rectangle at (163, 7) with width 12 and height 108.
; PLAN: r0=163(x), r1=7(y), r2=12(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 7
LDI r2, 12
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
