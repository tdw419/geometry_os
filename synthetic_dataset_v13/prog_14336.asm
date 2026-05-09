; DESCRIPTION: Creates a orange rectangular region at (338, 114) spanning 91 by 119 pixels.
; PLAN: r0=338(x), r1=114(y), r2=91(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 114
LDI r2, 91
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
