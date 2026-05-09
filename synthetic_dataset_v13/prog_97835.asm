; DESCRIPTION: Draws a orange rectangle at (308, 31) with width 98 and height 78.
; PLAN: r0=308(x), r1=31(y), r2=98(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 31
LDI r2, 98
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
