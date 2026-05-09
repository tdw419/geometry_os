; DESCRIPTION: Draws a orange rectangle at (52, 20) with width 58 and height 48.
; PLAN: r0=52(x), r1=20(y), r2=58(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 20
LDI r2, 58
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
