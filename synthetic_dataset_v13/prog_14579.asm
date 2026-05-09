; DESCRIPTION: Draws a orange rectangle at (193, 71) with width 112 and height 104.
; PLAN: r0=193(x), r1=71(y), r2=112(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 71
LDI r2, 112
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
