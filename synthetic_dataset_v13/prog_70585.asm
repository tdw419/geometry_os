; DESCRIPTION: Creates a black rectangular region at (281, 83) spanning 101 by 112 pixels.
; PLAN: r0=281(x), r1=83(y), r2=101(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 83
LDI r2, 101
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
