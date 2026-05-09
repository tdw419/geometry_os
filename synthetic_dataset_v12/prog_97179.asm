; DESCRIPTION: Draws a orange rectangle at (437, 87) with width 37 and height 29.
; PLAN: r0=437(x), r1=87(y), r2=37(width), r3=29(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 87
LDI r2, 37
LDI r3, 29
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
