; DESCRIPTION: Draws a orange rectangle at (283, 239) with width 68 and height 11.
; PLAN: r0=283(x), r1=239(y), r2=68(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 239
LDI r2, 68
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
