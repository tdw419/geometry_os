; DESCRIPTION: Draws a orange rectangle at (247, 147) with width 101 and height 60.
; PLAN: r0=247(x), r1=147(y), r2=101(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 147
LDI r2, 101
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
