; DESCRIPTION: Draws a orange rectangle at (253, 62) with width 81 and height 103.
; PLAN: r0=253(x), r1=62(y), r2=81(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 62
LDI r2, 81
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
