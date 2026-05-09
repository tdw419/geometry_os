; DESCRIPTION: Draws a orange rectangle at (133, 129) with width 119 and height 78.
; PLAN: r0=133(x), r1=129(y), r2=119(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 129
LDI r2, 119
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
