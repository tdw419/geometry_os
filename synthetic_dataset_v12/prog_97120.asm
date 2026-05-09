; DESCRIPTION: Creates a black rectangular region at (109, 63) spanning 85 by 78 pixels.
; PLAN: r0=109(x), r1=63(y), r2=85(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 63
LDI r2, 85
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
