; DESCRIPTION: Creates a black rectangular region at (253, 19) spanning 13 by 47 pixels.
; PLAN: r0=253(x), r1=19(y), r2=13(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 19
LDI r2, 13
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
