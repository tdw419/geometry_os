; DESCRIPTION: Draws a orange rectangle at (328, 133) with width 114 and height 26.
; PLAN: r0=328(x), r1=133(y), r2=114(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 133
LDI r2, 114
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
