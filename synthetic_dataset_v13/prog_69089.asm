; DESCRIPTION: Creates a black rectangular region at (293, 57) spanning 40 by 17 pixels.
; PLAN: r0=293(x), r1=57(y), r2=40(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 57
LDI r2, 40
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
