; DESCRIPTION: Draws a orange rectangle at (5, 14) with width 64 and height 54.
; PLAN: r0=5(x), r1=14(y), r2=64(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 14
LDI r2, 64
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
