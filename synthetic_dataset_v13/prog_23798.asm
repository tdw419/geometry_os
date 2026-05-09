; DESCRIPTION: Creates a black rectangular region at (154, 137) spanning 33 by 62 pixels.
; PLAN: r0=154(x), r1=137(y), r2=33(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 137
LDI r2, 33
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
