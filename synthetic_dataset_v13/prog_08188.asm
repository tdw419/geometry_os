; DESCRIPTION: Draws a orange rectangle at (437, 87) with width 47 and height 60.
; PLAN: r0=437(x), r1=87(y), r2=47(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 87
LDI r2, 47
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
