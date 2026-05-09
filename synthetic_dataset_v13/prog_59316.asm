; DESCRIPTION: Draws a orange rectangle at (337, 27) with width 107 and height 32.
; PLAN: r0=337(x), r1=27(y), r2=107(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 27
LDI r2, 107
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
