; DESCRIPTION: Creates a orange rectangular region at (379, 4) spanning 61 by 11 pixels.
; PLAN: r0=379(x), r1=4(y), r2=61(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 4
LDI r2, 61
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
