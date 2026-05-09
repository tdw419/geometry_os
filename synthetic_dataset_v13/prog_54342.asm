; DESCRIPTION: Creates a black rectangular region at (274, 138) spanning 99 by 62 pixels.
; PLAN: r0=274(x), r1=138(y), r2=99(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 138
LDI r2, 99
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
