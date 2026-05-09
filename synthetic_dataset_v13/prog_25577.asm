; DESCRIPTION: Creates a black rectangular region at (269, 97) spanning 83 by 71 pixels.
; PLAN: r0=269(x), r1=97(y), r2=83(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 97
LDI r2, 83
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
