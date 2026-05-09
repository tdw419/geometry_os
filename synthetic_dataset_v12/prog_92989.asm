; DESCRIPTION: Draws a orange rectangle at (156, 46) with width 115 and height 105.
; PLAN: r0=156(x), r1=46(y), r2=115(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 46
LDI r2, 115
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
