; DESCRIPTION: Creates a orange rectangular region at (15, 147) spanning 109 by 105 pixels.
; PLAN: r0=15(x), r1=147(y), r2=109(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 147
LDI r2, 109
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
