; DESCRIPTION: Draws a orange rectangle at (101, 48) with width 66 and height 38.
; PLAN: r0=101(x), r1=48(y), r2=66(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 48
LDI r2, 66
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
