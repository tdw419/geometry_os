; DESCRIPTION: Draws a orange rectangle at (418, 116) with width 75 and height 109.
; PLAN: r0=418(x), r1=116(y), r2=75(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 116
LDI r2, 75
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
