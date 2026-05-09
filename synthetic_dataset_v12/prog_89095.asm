; DESCRIPTION: Draws a orange rectangle at (139, 68) with width 50 and height 83.
; PLAN: r0=139(x), r1=68(y), r2=50(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 68
LDI r2, 50
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
