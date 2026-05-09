; DESCRIPTION: Creates a black rectangular region at (18, 2) spanning 94 by 35 pixels.
; PLAN: r0=18(x), r1=2(y), r2=94(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 2
LDI r2, 94
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
