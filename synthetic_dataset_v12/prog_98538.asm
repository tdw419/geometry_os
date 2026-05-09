; DESCRIPTION: Creates a orange rectangular region at (314, 195) spanning 55 by 36 pixels.
; PLAN: r0=314(x), r1=195(y), r2=55(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 195
LDI r2, 55
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
