; DESCRIPTION: Creates a orange rectangular region at (147, 203) spanning 53 by 21 pixels.
; PLAN: r0=147(x), r1=203(y), r2=53(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 203
LDI r2, 53
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
