; DESCRIPTION: Draws a red rectangle at (100, 56) with width 24 and height 45.
; PLAN: r0=100(x), r1=56(y), r2=24(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 56
LDI r2, 24
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
