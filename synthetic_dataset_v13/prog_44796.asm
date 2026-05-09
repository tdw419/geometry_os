; DESCRIPTION: Creates a orange rectangular region at (402, 14) spanning 85 by 19 pixels.
; PLAN: r0=402(x), r1=14(y), r2=85(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 14
LDI r2, 85
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
