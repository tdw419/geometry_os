; DESCRIPTION: Creates a black rectangular region at (79, 101) spanning 99 by 29 pixels.
; PLAN: r0=79(x), r1=101(y), r2=99(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 101
LDI r2, 99
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
