; DESCRIPTION: Draws a orange rectangle at (186, 97) with width 77 and height 104.
; PLAN: r0=186(x), r1=97(y), r2=77(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 97
LDI r2, 77
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
