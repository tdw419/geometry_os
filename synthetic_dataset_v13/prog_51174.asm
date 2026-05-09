; DESCRIPTION: Draws a orange rectangle at (187, 133) with width 56 and height 109.
; PLAN: r0=187(x), r1=133(y), r2=56(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 133
LDI r2, 56
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
