; DESCRIPTION: Creates a orange rectangular region at (147, 92) spanning 71 by 58 pixels.
; PLAN: r0=147(x), r1=92(y), r2=71(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 92
LDI r2, 71
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
