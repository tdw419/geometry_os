; DESCRIPTION: Draws a orange rectangle at (115, 163) with width 114 and height 86.
; PLAN: r0=115(x), r1=163(y), r2=114(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 163
LDI r2, 114
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
