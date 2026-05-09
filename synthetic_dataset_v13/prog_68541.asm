; DESCRIPTION: Draws a orange rectangle at (221, 149) with width 66 and height 91.
; PLAN: r0=221(x), r1=149(y), r2=66(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 149
LDI r2, 66
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
