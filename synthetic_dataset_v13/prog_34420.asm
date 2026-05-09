; DESCRIPTION: Creates a black rectangular region at (36, 30) spanning 19 by 34 pixels.
; PLAN: r0=36(x), r1=30(y), r2=19(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 30
LDI r2, 19
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
