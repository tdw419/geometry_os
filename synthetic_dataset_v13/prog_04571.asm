; DESCRIPTION: Draws a blue rectangle at (361, 33) with width 62 and height 85.
; PLAN: r0=361(x), r1=33(y), r2=62(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 33
LDI r2, 62
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
