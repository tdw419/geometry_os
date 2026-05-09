; DESCRIPTION: Draws a orange rectangle at (393, 30) with width 29 and height 58.
; PLAN: r0=393(x), r1=30(y), r2=29(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 30
LDI r2, 29
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
