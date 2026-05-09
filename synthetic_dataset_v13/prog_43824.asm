; DESCRIPTION: Draws a orange rectangle at (342, 38) with width 10 and height 106.
; PLAN: r0=342(x), r1=38(y), r2=10(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 38
LDI r2, 10
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
