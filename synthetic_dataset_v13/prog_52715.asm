; DESCRIPTION: Draws a orange rectangle at (231, 109) with width 46 and height 69.
; PLAN: r0=231(x), r1=109(y), r2=46(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 109
LDI r2, 46
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
