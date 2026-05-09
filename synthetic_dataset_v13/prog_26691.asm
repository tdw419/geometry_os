; DESCRIPTION: Creates a orange rectangular region at (3, 114) spanning 35 by 25 pixels.
; PLAN: r0=3(x), r1=114(y), r2=35(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 114
LDI r2, 35
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
