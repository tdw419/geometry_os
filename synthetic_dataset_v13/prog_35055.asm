; DESCRIPTION: Creates a black rectangular region at (408, 62) spanning 83 by 101 pixels.
; PLAN: r0=408(x), r1=62(y), r2=83(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 62
LDI r2, 83
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
