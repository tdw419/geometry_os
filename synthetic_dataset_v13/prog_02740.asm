; DESCRIPTION: Creates a orange rectangular region at (379, 106) spanning 47 by 63 pixels.
; PLAN: r0=379(x), r1=106(y), r2=47(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 106
LDI r2, 47
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
