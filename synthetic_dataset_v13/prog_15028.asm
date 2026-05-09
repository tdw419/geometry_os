; DESCRIPTION: Draws a orange rectangle at (191, 168) with width 66 and height 34.
; PLAN: r0=191(x), r1=168(y), r2=66(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 168
LDI r2, 66
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
