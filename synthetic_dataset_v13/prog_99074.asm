; DESCRIPTION: Creates a black rectangular region at (227, 99) spanning 27 by 61 pixels.
; PLAN: r0=227(x), r1=99(y), r2=27(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 99
LDI r2, 27
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
