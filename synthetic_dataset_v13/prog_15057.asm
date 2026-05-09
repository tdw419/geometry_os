; DESCRIPTION: Creates a magenta rectangular region at (13, 137) spanning 85 by 82 pixels.
; PLAN: r0=13(x), r1=137(y), r2=85(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 137
LDI r2, 85
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
