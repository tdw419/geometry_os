; DESCRIPTION: Draws a orange rectangle at (260, 125) with width 104 and height 60.
; PLAN: r0=260(x), r1=125(y), r2=104(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 125
LDI r2, 104
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
