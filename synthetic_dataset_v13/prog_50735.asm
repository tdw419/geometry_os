; DESCRIPTION: Draws a orange rectangle at (104, 120) with width 26 and height 87.
; PLAN: r0=104(x), r1=120(y), r2=26(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 120
LDI r2, 26
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
