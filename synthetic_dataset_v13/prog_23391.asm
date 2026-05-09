; DESCRIPTION: Creates a black rectangular region at (291, 23) spanning 21 by 61 pixels.
; PLAN: r0=291(x), r1=23(y), r2=21(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 23
LDI r2, 21
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
