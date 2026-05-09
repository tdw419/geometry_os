; DESCRIPTION: Draws a orange rectangle at (244, 173) with width 52 and height 63.
; PLAN: r0=244(x), r1=173(y), r2=52(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 173
LDI r2, 52
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
