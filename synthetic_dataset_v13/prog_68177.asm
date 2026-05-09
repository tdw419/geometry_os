; DESCRIPTION: Creates a black rectangular region at (31, 43) spanning 54 by 27 pixels.
; PLAN: r0=31(x), r1=43(y), r2=54(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 43
LDI r2, 54
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
