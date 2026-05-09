; DESCRIPTION: Creates a orange rectangular region at (382, 80) spanning 101 by 69 pixels.
; PLAN: r0=382(x), r1=80(y), r2=101(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 80
LDI r2, 101
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
