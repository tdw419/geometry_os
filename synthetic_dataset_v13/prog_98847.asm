; DESCRIPTION: Draws a orange rectangle at (248, 112) with width 67 and height 31.
; PLAN: r0=248(x), r1=112(y), r2=67(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 112
LDI r2, 67
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
