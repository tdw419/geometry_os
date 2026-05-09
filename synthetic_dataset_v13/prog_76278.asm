; DESCRIPTION: Draws a orange rectangle at (204, 5) with width 82 and height 98.
; PLAN: r0=204(x), r1=5(y), r2=82(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 5
LDI r2, 82
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
