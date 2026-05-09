; DESCRIPTION: Draws a orange rectangle at (341, 27) with width 17 and height 63.
; PLAN: r0=341(x), r1=27(y), r2=17(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 27
LDI r2, 17
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
