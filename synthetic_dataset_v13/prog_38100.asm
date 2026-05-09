; DESCRIPTION: Creates a orange rectangular region at (109, 24) spanning 15 by 34 pixels.
; PLAN: r0=109(x), r1=24(y), r2=15(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 24
LDI r2, 15
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
