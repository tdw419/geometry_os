; DESCRIPTION: Draws a orange rectangle at (395, 5) with width 95 and height 66.
; PLAN: r0=395(x), r1=5(y), r2=95(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 5
LDI r2, 95
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
