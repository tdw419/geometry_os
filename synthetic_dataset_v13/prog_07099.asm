; DESCRIPTION: Draws a orange rectangle at (156, 36) with width 35 and height 48.
; PLAN: r0=156(x), r1=36(y), r2=35(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 36
LDI r2, 35
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
