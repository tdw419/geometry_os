; DESCRIPTION: Draws a orange rectangle at (90, 207) with width 95 and height 36.
; PLAN: r0=90(x), r1=207(y), r2=95(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 207
LDI r2, 95
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
