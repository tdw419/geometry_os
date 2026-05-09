; DESCRIPTION: Creates a orange rectangular region at (309, 189) spanning 29 by 58 pixels.
; PLAN: r0=309(x), r1=189(y), r2=29(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 189
LDI r2, 29
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
