; DESCRIPTION: Creates a orange rectangular region at (112, 114) spanning 18 by 60 pixels.
; PLAN: r0=112(x), r1=114(y), r2=18(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 114
LDI r2, 18
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
