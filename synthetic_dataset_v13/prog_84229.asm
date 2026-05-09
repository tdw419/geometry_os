; DESCRIPTION: Draws a orange rectangle at (95, 17) with width 14 and height 31.
; PLAN: r0=95(x), r1=17(y), r2=14(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 17
LDI r2, 14
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
