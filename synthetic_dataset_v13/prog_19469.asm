; DESCRIPTION: Draws a orange rectangle at (404, 48) with width 13 and height 107.
; PLAN: r0=404(x), r1=48(y), r2=13(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 48
LDI r2, 13
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
