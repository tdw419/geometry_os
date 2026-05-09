; DESCRIPTION: Creates a orange rectangular region at (341, 189) spanning 82 by 14 pixels.
; PLAN: r0=341(x), r1=189(y), r2=82(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 189
LDI r2, 82
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
