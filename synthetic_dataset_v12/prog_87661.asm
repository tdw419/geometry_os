; DESCRIPTION: Creates a black rectangular region at (293, 68) spanning 72 by 43 pixels.
; PLAN: r0=293(x), r1=68(y), r2=72(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 68
LDI r2, 72
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
