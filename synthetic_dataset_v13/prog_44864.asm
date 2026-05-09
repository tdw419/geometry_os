; DESCRIPTION: Draws a orange rectangle at (129, 50) with width 82 and height 13.
; PLAN: r0=129(x), r1=50(y), r2=82(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 50
LDI r2, 82
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
