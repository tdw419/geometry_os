; DESCRIPTION: Draws a orange rectangle at (30, 133) with width 95 and height 19.
; PLAN: r0=30(x), r1=133(y), r2=95(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 133
LDI r2, 95
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
