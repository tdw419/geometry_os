; DESCRIPTION: Draws a orange rectangle at (408, 133) with width 27 and height 22.
; PLAN: r0=408(x), r1=133(y), r2=27(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 133
LDI r2, 27
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
