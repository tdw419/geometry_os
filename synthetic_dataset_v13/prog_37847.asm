; DESCRIPTION: Draws a orange rectangle at (402, 43) with width 14 and height 93.
; PLAN: r0=402(x), r1=43(y), r2=14(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 43
LDI r2, 14
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
