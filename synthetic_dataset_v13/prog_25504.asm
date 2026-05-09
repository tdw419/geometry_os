; DESCRIPTION: Draws a orange rectangle at (390, 82) with width 50 and height 54.
; PLAN: r0=390(x), r1=82(y), r2=50(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 82
LDI r2, 50
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
