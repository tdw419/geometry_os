; DESCRIPTION: Draws a orange rectangle at (68, 57) with width 95 and height 31.
; PLAN: r0=68(x), r1=57(y), r2=95(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 57
LDI r2, 95
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
