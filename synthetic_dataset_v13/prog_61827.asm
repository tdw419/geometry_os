; DESCRIPTION: Creates a orange rectangular region at (115, 58) spanning 115 by 68 pixels.
; PLAN: r0=115(x), r1=58(y), r2=115(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 58
LDI r2, 115
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
