; DESCRIPTION: Creates a orange rectangular region at (71, 58) spanning 79 by 76 pixels.
; PLAN: r0=71(x), r1=58(y), r2=79(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 58
LDI r2, 79
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
