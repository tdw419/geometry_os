; DESCRIPTION: Creates a black rectangular region at (99, 178) spanning 61 by 62 pixels.
; PLAN: r0=99(x), r1=178(y), r2=61(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 178
LDI r2, 61
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
