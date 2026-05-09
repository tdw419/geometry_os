; DESCRIPTION: Creates a black rectangular region at (42, 11) spanning 62 by 35 pixels.
; PLAN: r0=42(x), r1=11(y), r2=62(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 11
LDI r2, 62
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
