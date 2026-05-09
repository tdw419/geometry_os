; DESCRIPTION: Creates a black rectangular region at (355, 10) spanning 112 by 19 pixels.
; PLAN: r0=355(x), r1=10(y), r2=112(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 10
LDI r2, 112
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
