; DESCRIPTION: Creates a black rectangular region at (227, 109) spanning 70 by 94 pixels.
; PLAN: r0=227(x), r1=109(y), r2=70(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 109
LDI r2, 70
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
