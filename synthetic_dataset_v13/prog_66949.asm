; DESCRIPTION: Draws a orange rectangle at (404, 105) with width 80 and height 70.
; PLAN: r0=404(x), r1=105(y), r2=80(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 105
LDI r2, 80
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
