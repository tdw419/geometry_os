; DESCRIPTION: Creates a orange rectangular region at (379, 109) spanning 65 by 111 pixels.
; PLAN: r0=379(x), r1=109(y), r2=65(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 109
LDI r2, 65
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
