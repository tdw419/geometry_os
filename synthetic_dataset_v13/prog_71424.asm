; DESCRIPTION: Draws a orange rectangle at (139, 168) with width 54 and height 76.
; PLAN: r0=139(x), r1=168(y), r2=54(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 168
LDI r2, 54
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
