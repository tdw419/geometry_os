; DESCRIPTION: Creates a black rectangular region at (77, 216) spanning 21 by 13 pixels.
; PLAN: r0=77(x), r1=216(y), r2=21(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 216
LDI r2, 21
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
