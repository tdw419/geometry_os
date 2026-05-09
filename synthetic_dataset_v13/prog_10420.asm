; DESCRIPTION: Draws a orange rectangle at (404, 81) with width 103 and height 29.
; PLAN: r0=404(x), r1=81(y), r2=103(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 81
LDI r2, 103
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
