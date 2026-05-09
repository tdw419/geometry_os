; DESCRIPTION: Creates a orange rectangular region at (147, 166) spanning 66 by 73 pixels.
; PLAN: r0=147(x), r1=166(y), r2=66(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 166
LDI r2, 66
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
