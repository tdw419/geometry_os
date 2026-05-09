; DESCRIPTION: Creates a orange rectangular region at (155, 13) spanning 12 by 28 pixels.
; PLAN: r0=155(x), r1=13(y), r2=12(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 13
LDI r2, 12
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
