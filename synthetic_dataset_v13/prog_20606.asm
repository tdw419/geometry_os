; DESCRIPTION: Draws a orange rectangle at (34, 74) with width 24 and height 108.
; PLAN: r0=34(x), r1=74(y), r2=24(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 74
LDI r2, 24
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
