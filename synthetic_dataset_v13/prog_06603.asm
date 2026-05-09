; DESCRIPTION: Draws a orange rectangle at (128, 138) with width 91 and height 107.
; PLAN: r0=128(x), r1=138(y), r2=91(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 138
LDI r2, 91
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
