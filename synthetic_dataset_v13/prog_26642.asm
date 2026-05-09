; DESCRIPTION: Draws a orange rectangle at (342, 98) with width 98 and height 100.
; PLAN: r0=342(x), r1=98(y), r2=98(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 98
LDI r2, 98
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
