; DESCRIPTION: Draws a orange rectangle at (266, 79) with width 71 and height 21.
; PLAN: r0=266(x), r1=79(y), r2=71(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 79
LDI r2, 71
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
