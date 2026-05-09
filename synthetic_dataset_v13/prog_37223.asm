; DESCRIPTION: Draws a orange rectangle at (324, 148) with width 103 and height 70.
; PLAN: r0=324(x), r1=148(y), r2=103(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 148
LDI r2, 103
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
