; DESCRIPTION: Creates a yellow rectangular region at (389, 85) spanning 13 by 82 pixels.
; PLAN: r0=389(x), r1=85(y), r2=13(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 85
LDI r2, 13
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
