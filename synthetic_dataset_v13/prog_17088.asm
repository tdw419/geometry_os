; DESCRIPTION: Draws a orange rectangle at (266, 126) with width 55 and height 64.
; PLAN: r0=266(x), r1=126(y), r2=55(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 126
LDI r2, 55
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
