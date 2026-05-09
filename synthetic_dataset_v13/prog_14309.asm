; DESCRIPTION: Creates a orange rectangular region at (147, 14) spanning 95 by 47 pixels.
; PLAN: r0=147(x), r1=14(y), r2=95(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 14
LDI r2, 95
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
