; DESCRIPTION: Draws a orange rectangle at (92, 56) with width 52 and height 68.
; PLAN: r0=92(x), r1=56(y), r2=52(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 56
LDI r2, 52
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
