; DESCRIPTION: Creates a orange rectangular region at (331, 28) spanning 119 by 114 pixels.
; PLAN: r0=331(x), r1=28(y), r2=119(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 28
LDI r2, 119
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
