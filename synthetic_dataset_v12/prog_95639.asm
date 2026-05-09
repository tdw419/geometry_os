; DESCRIPTION: Draws a orange rectangle at (107, 169) with width 46 and height 10.
; PLAN: r0=107(x), r1=169(y), r2=46(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 169
LDI r2, 46
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
