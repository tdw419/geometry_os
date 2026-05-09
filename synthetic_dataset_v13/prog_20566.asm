; DESCRIPTION: Creates a black rectangular region at (78, 86) spanning 45 by 45 pixels.
; PLAN: r0=78(x), r1=86(y), r2=45(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 86
LDI r2, 45
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
