; DESCRIPTION: Creates a orange rectangular region at (396, 98) spanning 72 by 75 pixels.
; PLAN: r0=396(x), r1=98(y), r2=72(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 98
LDI r2, 72
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
