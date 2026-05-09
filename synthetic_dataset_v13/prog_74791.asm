; DESCRIPTION: Creates a black rectangular region at (212, 69) spanning 100 by 73 pixels.
; PLAN: r0=212(x), r1=69(y), r2=100(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 69
LDI r2, 100
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
