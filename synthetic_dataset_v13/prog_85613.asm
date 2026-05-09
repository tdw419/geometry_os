; DESCRIPTION: Creates a black rectangular region at (291, 34) spanning 63 by 43 pixels.
; PLAN: r0=291(x), r1=34(y), r2=63(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 34
LDI r2, 63
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
