; DESCRIPTION: Creates a orange rectangular region at (235, 114) spanning 56 by 53 pixels.
; PLAN: r0=235(x), r1=114(y), r2=56(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 114
LDI r2, 56
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
