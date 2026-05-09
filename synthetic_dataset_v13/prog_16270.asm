; DESCRIPTION: Draws a orange rectangle at (57, 119) with width 21 and height 108.
; PLAN: r0=57(x), r1=119(y), r2=21(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 119
LDI r2, 21
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
