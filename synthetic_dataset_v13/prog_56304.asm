; DESCRIPTION: Creates a orange rectangular region at (60, 142) spanning 101 by 102 pixels.
; PLAN: r0=60(x), r1=142(y), r2=101(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 142
LDI r2, 101
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
