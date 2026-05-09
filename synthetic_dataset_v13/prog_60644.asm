; DESCRIPTION: Creates a black rectangular region at (454, 226) spanning 46 by 23 pixels.
; PLAN: r0=454(x), r1=226(y), r2=46(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 226
LDI r2, 46
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
