; DESCRIPTION: Draws a orange rectangle at (129, 72) with width 62 and height 120.
; PLAN: r0=129(x), r1=72(y), r2=62(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 72
LDI r2, 62
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
