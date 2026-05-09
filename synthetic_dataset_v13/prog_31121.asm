; DESCRIPTION: Creates a black rectangular region at (283, 73) spanning 40 by 14 pixels.
; PLAN: r0=283(x), r1=73(y), r2=40(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 73
LDI r2, 40
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
