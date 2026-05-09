; DESCRIPTION: Draws a orange rectangle at (58, 27) with width 110 and height 82.
; PLAN: r0=58(x), r1=27(y), r2=110(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 27
LDI r2, 110
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
