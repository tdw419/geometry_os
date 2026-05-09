; DESCRIPTION: Draws a orange rectangle at (372, 144) with width 78 and height 10.
; PLAN: r0=372(x), r1=144(y), r2=78(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 144
LDI r2, 78
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
