; DESCRIPTION: Creates a orange rectangular region at (408, 147) spanning 95 by 20 pixels.
; PLAN: r0=408(x), r1=147(y), r2=95(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 147
LDI r2, 95
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
