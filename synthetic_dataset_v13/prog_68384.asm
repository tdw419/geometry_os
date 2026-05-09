; DESCRIPTION: Creates a orange rectangular region at (315, 34) spanning 85 by 61 pixels.
; PLAN: r0=315(x), r1=34(y), r2=85(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 34
LDI r2, 85
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
